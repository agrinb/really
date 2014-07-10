class ApptMailer < ActionMailer::Base
  default from: "new_appointment@reeally.com"

  def notify_agents(appointment)
    @appointment = appointment
    agent_users = find_agents(zip_code(appointment))
    agent_users.each do |user|
      mail(to: user.email, subject: 'Welcome to My Awesome Site')
    end
  end

  def zip_code(appointment)
    appointment.property.zip_code
  end

  def find_agents(zip_code)
    agent_profiles = AgentProfile.where(zip_code: zip_code)
    agent_users = agent_profiles.map { |agent| agent.user_id }
  end
end
