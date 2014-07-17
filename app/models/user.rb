class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :cell_phone, presence: true, uniqueness: true, length: { is: 12 }
  validates :role, presence: true

  has_many :properties, dependent: :destroy
  has_one :agent_profile, dependent: :destroy
  accepts_nested_attributes_for :agent_profile,
    reject_if: Proc.new { |user| user['role'] == 'seller' }
  accepts_nested_attributes_for :properties

  def is_agent?
    role == "agent"
  end
end
