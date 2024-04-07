class Dog < ApplicationRecord
  has_one :dog_lists
  has_many :reviews, dependent: :destroy
  has_many :payments

  validates :name, :breed, :story, :photo_url, presence: true
  validates :available_for_adoption, inclusion: { in: [true, false] }
  DOG_TYPES = ['Guard', 'Service', 'Herding', 'Companion']
  validates :dog_type, inclusion: { in: DOG_TYPES }

  scope :available, -> { where(available_for_adoption: true) }
  scope :by_breed, ->(breed) { where(breed: breed) if breed.present? }
  scope :by_age, ->(min_age, max_age) { where(age: min_age..max_age) if min_age.present? && max_age.present? }
  scope :by_size, ->(size) { where(size: size) if size.present? }
  scope :search_by_breed, ->(breed) { where('breed ILIKE ?', "%#{breed}%") }
  scope :filter_by_type, ->(dog_type) { where(dog_type: dog_type) if dog_type.present? }
  def self.ransackable_associations(auth_object = nil)
    %w[reviews dog_list]
  end


  # If you also want to specify which attributes can be searched, add:
  def self.ransackable_attributes(auth_object = nil)
    # List of searchable attributes
    %w[name breed available_for_adoption]
  end
end
