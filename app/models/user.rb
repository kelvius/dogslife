class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  belongs_to :province
  validates :address, presence: true

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_one :profile
  has_many :payments
  has_many :reviews, through: :dogs
  has_one_attached :image
  # def self.ransackable_attributes(auth_object = nil)
  #   super + ['custom_method']
  # end
    def self.ransackable_attributes(auth_object = nil)
      ["address", "contact_number", "created_at", "email", "encrypted_password", "id", "id_value", "password_digest", "payment_type", "remember_created_at", "reset_password_sent_at", "reset_password_token", "updated_at", "username"]
    end

end
