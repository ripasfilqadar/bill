class ApplicationController < ActionController::Base

  layout 'admin_lte_2'

  include Pundit
  protect_from_forgery with: :exception
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  helper_method :current_user

  def authorize(*args)
    super(*args, current_user)
  end

  def current_user
    return @current_user if defined? @current_user
    current_user!
  rescue
    nil
  end

  def current_user_session
    @current_user_session ||= UserSession.find
  end

  private
  def current_user!
    @current_user = (current_user_session && current_user_session.user)
    @current_user.access_ip = request.remote_ip if @current_user
    @current_user
  end

  def user_not_authorized
    if current_user.nil?
      flash[:alert] = 'Anda harus login terlebih dahulu'
      redirect_to login_path
    else
      flash[:alert] = 'Anda tidak berhak mengakses halaman ini'
      redirect_to home_path
    end
  end
end
