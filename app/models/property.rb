class Property < ActiveRecord::Base
  mount_uploader :photo, PhotoUploader

  belongs_to :user
  has_many :appointments, dependent: :destroy
  validates :name, presence: true
  validates :description, presence: true
  validates :address, presence: true
  validates :city, presence: true
  validates :state, presence: true
  validates :bedrooms, presence: true
  validates :bathrooms, presence: true
  validates :zip_code, presence: true


  geocoded_by :full_street_address
  after_validation :geocode

  accepts_nested_attributes_for :user

  def full_street_address
    [address, city, state, zip_code].compact.join(', ')
  end

end
