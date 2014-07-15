class AgentProfile < ActiveRecord::Base
  # validates :user, presence: true, uniqueness: true
  belongs_to :user

  geocoded_by :address
  after_validation :geocode

  def address
    zip_code
  end
end
