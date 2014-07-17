class AppointmentsController <ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :update, :edit]
  before_action :authorize_agent, only: [:index, :update]


  def new
    @property = Property.find(params[:property_id])
    @appointment = Appointment.new
  end

  def create
    @property = Property.find(params[:property_id])
    @appointment = Appointment.new(appointment_params)
    @appointment.property = @property
    ApptMailer.send_notify_agents(@appointment)
    if @appointment.save
      flash[:notice] = "Appointment created successfully."
      redirect_to property_path(@property)
    else
      render :new
    end
  end

  def index
    agent = AgentProfile.find(params[:agent_profile_id])
    radius = agent.radius
    properties_near = Property.near(agent, agent.radius)
    property_ids = []
    properties_near.each do |property|
      property_ids << property.id
    end
    @appointments = Appointment.joins(:property).where('property_id' => property_ids, agent_profile: nil)
    @my_appointments = Appointment.where(agent_profile_id: agent.id)
  end

  def update
    @appointment = Appointment.find(params[:id])
    @appointment.agent_profile_id = current_user.agent_profile.id
    if @appointment.save
      flash[:notice] = "You successfully claimed this appointment"
      redirect_to "/agent_profiles/#{current_user.agent_profile.id}/appointments"
    else
      flash[:alert] = "Sorry, that didn't work. Please try again."
      render :index
    end
  end

  def show
    @appointment = Appointment.find(params[:id])
  end



  private
  def authorize_agent
    unless current_user && current_user.is_agent?
      flash[:alert] = "You must be an agent to view this page."
      redirect_to "/"
    end
  end


  def appointment_params
    params.require(:appointment).permit(:user_id, :agent_profile_id, :property_id, :instructions, :visitor, :visitor_phone, :visitor_email, :meeting, :appointment_id)
  end
end
