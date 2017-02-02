class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
   before_filter :configure_permitted_parameters, if: :devise_controller?


  protected 
  
  # Strong params for devise
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :location_string])
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, :last_name])
  end

  # Redirect for devise sign out
  def after_sign_out_path_for(resource_or_scope)
    new_user_session_path
  end
end
