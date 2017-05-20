class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  # Devise
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!
  
  # Log de todas resquisições ao servidor
  impressionist
 
  include Pundit
  after_action :verify_authorized, unless: :devise_controller?
  
  protected

  def configure_permitted_parameters
    update_attrs = [:password, :password_confirmation, :current_password, :photo, :photo_cache, :name, :email, :registration]
    devise_parameter_sanitizer.permit :account_update, keys: update_attrs
  	devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  	devise_parameter_sanitizer.permit(:sign_up, keys: [:registration])
  	devise_parameter_sanitizer.permit(:sign_up, keys: [:district_id])
  	devise_parameter_sanitizer.permit(:sign_up, keys: [:registration_date])
  	devise_parameter_sanitizer.permit(:sign_up, keys: [:user_group_id])
    devise_parameter_sanitizer.permit(:sign_up, keys: [:photo])
  end
  
end
