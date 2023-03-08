class ApplicationController < ActionController::Base
<<<<<<< HEAD
  protect_from_forgery with: :null_session
  # before_action :authenticate_user!
=======
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    # For additional fields in app/views/devise/registrations/new.html.erb
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :address, :phone_number, :photo])

    # For additional in app/views/devise/registrations/edit.html.erb
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name,:address, :phone_number, :photo])
  end
>>>>>>> 8a10ecda7b82d2c40fe96b73f41aa6804078b861
end
