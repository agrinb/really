class RegistrationsController < Devise::RegistrationsController
  after_filter :delete_invalid_profile, only: :create

  protected

  def delete_invalid_profile
    user = User.find_by(email: params[:user][:email])
      if user.role == "seller"
        user.agent_profile.destroy
      end
  end
end


