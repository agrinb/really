class ApptMailer < ActionMailer::Base
  default from: "new_appointment@reeally.com"

  def notify_agents(user, appointment)
    @property = appointment.property
    @appointment = appointment
    @user = user
    mail(to: @user.email, subject: 'Welcome to My Awesome Site')
  end

  def self.send_notify_agents(appointment)
    @agent_users = find_agents(zip_code(appointment))
    @agent_users.each do |user|
      notify_agents(user, appointment).deliver
    end
  end

  def self.zip_code(appointment)
    appointment.property.zip_code
  end

  def self.find_agents(zip_code)
    agent_profiles = AgentProfile.where(zip_code: zip_code)
    binding.pry
    agent_users = agent_profiles.map { |agent| agent.user }
  end
end
