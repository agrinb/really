class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :cell_phone, presence: true, uniqueness: true, length: { is: 12 }
  validates :role, presence: true

  has_many :properties
  accepts_nested_attributes_for :properties
end
