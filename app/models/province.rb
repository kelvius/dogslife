class Province < ApplicationRecord
  has_many :users
  def self.ransackable_attributes(auth_object = nil)
    ["created_at", "gst", "hst", "id", "id_value", "name", "pst", "tax_type", "updated_at"]
  end

  def self.ransackable_associations(auth_object = nil)
    ["users"]
  end
end
