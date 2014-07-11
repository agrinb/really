class Agent::AppointmentsController <ApplicationController
  before_filter :authorize_agent


  private
  def authorize_agent
    unless current_user && current_user.is_agent?
      flash[:alert] = "You must be an agent to view this page."
      redirect_to "/"
    end
  end
end
