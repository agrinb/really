class AppointmentsController <ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :update, :edit]


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

    agent = AgentProfile.find(params[:agent_id])
    radius = agent.radius
    properties_near = Property.near(agent, agent.radius)
    property_ids = []
    properties_near.each do |property|
      property_ids << property.id
    end
    @appointments = Appointment.joins(:property).where('property_id' => property_ids, agent_profile: nil)
  end



  def appointment_params
    params.require(:appointment).permit(:user_id, :agent_profile_id, :property_id, :instructions, :visitor, :visitor_phone, :visitor_email, :meeting)
  end
end
