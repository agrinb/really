class AgentProfile < ActiveRecord::Base
  # validates :user, presence: true, uniqueness: true
  belongs_to :user
  has_many :appointments

  geocoded_by :address
  after_validation :geocode

  def address
    zip_code
  end
end
