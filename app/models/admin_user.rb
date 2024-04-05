class AdminUser < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable,
         :recoverable, :rememberable, :validatable

         def self.ransackable_attributes(auth_object = nil)
          # Return an array of attribute names that can be searched
          # Do not include sensitive fields like `encrypted_password`
          %w[id email created_at updated_at]
        end

        # You might also want to define ransackable associations if you have related models
        def self.ransackable_associations(auth_object = nil)
          # Return an array of association names that can be searched
          []
        end
end
