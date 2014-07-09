class AgentProfile < ActiveRecord::Base
  # validates :user, presence: true, uniqueness: true
  validates :zip_code, presence: true
  validates :from_hour, presence: true
  validates :to_hour, presence: true
  validates :description, presence: true
  validates :years_of_experience, presence: true
  belongs_to :user
end
