class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
 # protect_from_forgery with: :exception

  
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_filter :store_current_location, :unless => :devise_controller?

  protected
  def store_current_location
    store_location_for(:user, request.url)
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name])
  end
  
  def user_root_path
    '/dashboard/home'
  end
  
  #로그아웃시 current page에 남고 싶으면 사용
  # private
  # # override the devise method for where to go after signing out because theirs
  # # always goes to the root path. Because devise uses a session variable and
  # # the session is destroyed on log out, we need to use request.referrer
  # # root_path is there as a backup
  # def after_sign_out_path_for(resource)
    # request.referrer || root_path
  # end
  
end
