class HomePolicy < ApplicationPolicy

	def index?
		user.persisted?
	end
end