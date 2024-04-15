# frozen_string_literal: true

class Province < ApplicationRecord
  has_many :users, dependent: :destroy
  def self.ransackable_attributes(_auth_object = nil)
    %w[created_at gst hst id id_value name pst tax_type updated_at]
  end

  def self.ransackable_associations(_auth_object = nil)
    ['users']
  end
end
