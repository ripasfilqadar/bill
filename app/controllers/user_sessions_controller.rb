class UserSessionsController < ApplicationController
	layout 'admin_lte_2_login'
	def index
		authorize UserSession
	end

	def new
		authorize UserSession
		@user_session = UserSession.new
	end

	def create
		authorize UserSession
		logged_in, @user_session, login_message = UserService.login(params)
		if logged_in
			redirect_to home_path
		else
			flash[:alert] = login_message
			@user_session ||= UserSession.new
			render 'new'
		end
	end

	def destroy
		authorize UserSession
	end
end