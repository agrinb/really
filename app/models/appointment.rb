class Appointment < ActiveRecord::Base
  validates :property, presence: true
  validates :visitor, presence: true
  validates :visitor_phone, presence: true, length: { is: 12 }
  validates :meeting, presence: true
  validate :meeting_cannot_be_in_the_past, on: :create

  belongs_to :property
  belongs_to :agent_profile

  def meeting_cannot_be_in_the_past
    if meeting.present? && meeting.past?
      errors.add(:meeting, "can't be in the past!")
    end
  end
end
