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
    ApptMailer.notify_agents(@appointment).deliver
    if @appointment.save
      flash[:notice] = "Appointment created successfully."
      redirect_to property_path
    else
      render :new
    end
  end

  def index
  end

  def claim_appointment
  end

  def appointment_params
    params.require(:appointment).permit(:user_id, :agent_profile_id, :property_id, :instructions, :visitor, :visitor_phone, :visitor_email, :meeting)
  end
end
