class ApplicationController < ActionController::Base
  before_action :authenticate_user!, :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[first_name last_name username])
  end

  def default_url_options
    { host: ENV["www.wayfindr.co.uk"] || "localhost:3000" }
  end

end
