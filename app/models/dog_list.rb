class DogList < ApplicationRecord
  belongs_to :dog

  def self.ransackable_attributes(auth_object = nil)
    # Update this list with attributes of DogList you want to be searchable
    ["breed", "created_at", "id", "information", "pet_name", "photo_url", "updated_at"]
  end

end
