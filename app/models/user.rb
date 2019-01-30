class User < ActiveRecord::Base

	validates_presence_of :name, message: I18n.t(:name_must_present)
	validates_presence_of :email, message: I18n.t(:email_must_present)

	validate :password_confirmation_valid

	USER = 0
	ADMINISTRATOR = 1
	SUPERADMIN = 2
	
	enum role: {
		user: USER,
		admin: ADMINISTRATOR,
		superadmin: SUPERADMIN
	}


	acts_as_authentic do |config|
		config.validate_login_field = false
		config.logged_in_timeout = 3000.minutes
		config.transition_from_crypto_providers = [Authlogic::CryptoProviders::Sha512]
		config.crypto_provider = Authlogic::CryptoProviders::BCrypt
		config.login_field = :username
	end
	
	private

	def password_confirmation_valid
		unless self.password == self.password_confirmation
			self.errors.add(:password_confirmation, I18n.t('user.password_confirmation_not_match'))
			return false
		end
	end

end