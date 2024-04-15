# frozen_string_literal: true

class Dog < ApplicationRecord
  has_one :dog_list, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_many :payments, dependent: :destroy

  validates :name, :breed, :story, :photo_url, presence: true
  validates :available_for_adoption, inclusion: { in: [true, false] }
  DOG_TYPES = %w[Guard Service Herding Companion].freeze
  validates :dog_type, inclusion: { in: DOG_TYPES }

  scope :new_arrivals, -> { where('created_at >= ?', 3.days.ago) }
  scope :available, -> { where(available_for_adoption: true) }
  scope :by_breed, ->(breed) { where(breed:) if breed.present? }
  scope :by_age, ->(min_age, max_age) { where(age: min_age..max_age) if min_age.present? && max_age.present? }
  scope :by_size, ->(size) { where(size:) if size.present? }
  scope :filter_by_type, ->(dog_type) { where(dog_type:) if dog_type.present? }
  def self.ransackable_associations(_auth_object = nil)
    %w[reviews dog_list]
  end

  # Search by keyword in name, breed, or dog_type
  def self.search_by_keyword(keyword)
    if keyword.present?
      where('name ILIKE :keyword OR breed ILIKE :keyword OR dog_type ILIKE :keyword', keyword: "%#{keyword}%")
    else
      all
    end
  end

  # If you also want to specify which attributes can be searched, add:
  def self.ransackable_attributes(_auth_object = nil)
    # List of searchable attributes
    %w[name breed available_for_adoption]
  end
end
