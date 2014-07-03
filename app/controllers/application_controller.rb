class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def configure_permitted_parameters
    binding.pry
    devise_parameter_sanitizer.for(:sign_in) { |u| u.permit(:email, :password, :first_name, :last_name, :role, :cell_phone) }
  end
end
