class DateTimeValidator < ActiveModel::Validator
  def validate(appointment)
    unless appointment.meeting.future?
      appointment.errors[:meeting] << 'Appointment must be in the future!'
    end
  end
end
