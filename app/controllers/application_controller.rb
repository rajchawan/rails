class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    permitted_keys = %i[first_name last_name email age date_of_birth password]

    devise_parameter_sanitizer.permit(:sign_up, keys: permitted_keys)
    devise_parameter_sanitizer.permit(:account_update, keys: permitted_keys)
  end
end
