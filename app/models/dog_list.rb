class DogList < ApplicationRecord
  belongs_to :dog

  # Define attributes of DogList that should be searchable
  def self.ransackable_attributes(auth_object = nil)
    # Assuming these are the columns in DogList you want to make searchable
    ["dog_id","breed", "created_at", "information", "pet_name", "photo_url", "updated_at"]
  end

  # Define associations of DogList that should be searchable
  def self.ransackable_associations(auth_object = nil)
    # If you want to allow searching through associated 'dog' records
    ['dog']
  end
end
