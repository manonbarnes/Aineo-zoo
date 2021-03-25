class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :role, :address, :phone_number, :date_of_birth, :photo])
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, :role, :address, :phone_number, :date_of_birth, :photo])
  end

  def after_sign_in_path_for(user)
    animals_path
  end
end
