class Agent::AppointmentsController <ApplicationController
  before_filter :authorize_agent


  def index
    # agent = AgentProfile.find(params[:id])
    # radius = agent.radius
    # properties = Property.nearbys(radius)
    # #appointments = appointments for proprties and Appointment.where(agent_profile_id: nil)
    # @appointment = Property.all
  end

  def update
    @appointment = Appointment.find(params[:id])
    @appointment.agent_profile_id = current_user.id
    if @appointment.save
      flash[:notice] = "You successfully claimed this appointment"
      redirect_to agent_appointments_path
    else
      flash[:alert] = "Sorry, that didn't work. Please try again."
      render :index
    end
  end



  private
  def authorize_agent
    unless current_user && current_user.is_agent?
      flash[:alert] = "You must be an agent to view this page."
      redirect_to "/"
    end
  end


end
