class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  before_filter :configure_permitted_parameters, if: :devise_controller?
  before_filter
  protect_from_forgery with: :exception



  def after_sign_in_path_for(resource)
    if current_user.role == "agent"
    "/agent_profiles/#{current_user.agent_profile.id}/appointments"
    else
      properties_path
    end
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:email, :password, :password_confirmation, :first_name, :last_name,
     :role, :cell_phone, agent_profile_attributes: [:zip_code, :radius, :description, :from_hour, :to_hour, :realty]) }
  end
end
