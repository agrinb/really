class AgentProfile < ActiveRecord::Base
  validates :user_id, presence: true, uniqueness: true
  validates :zip_code, presence: true
  validates :from_hour, presence: true
  validates :to_hour, presence: true
  validates :description, presence: true
  validates :years_of_experience, presence: true
  has_one :user
end
