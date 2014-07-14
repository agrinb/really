class AgentProfile < ActiveRecord::Base
  # validates :user, presence: true, uniqueness: true
  validates :zip_code, presence: true
  validates :from_hour, presence: true
  validates :to_hour, presence: true
  validates :description, presence: true
  belongs_to :user

  geocoded_by :address
  after_validation :geocode

  def address
    binding.pry
    zip_code
  end
end
