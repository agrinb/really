class Appointment < ActiveRecord::Base
  validates :property, presence: true
  validates :visitor, presence: true
  validates :visitor_phone, presence: true, length: { is: 12 }
  validates :meeting, presence: true

  belongs_to :property
  belongs_to :agent_profile
end
