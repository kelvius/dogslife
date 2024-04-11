class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  validates :address, presence: true
  validates :province, presence: true

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_one :profile
  has_many :payments
  has_many :reviews, through: :dogs

  def self.ransackable_attributes(auth_object = nil)
    super + ['custom_method']
  end
end
