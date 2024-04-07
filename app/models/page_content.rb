class PageContent < ApplicationRecord

  def self.ransackable_attributes(auth_object = nil)
    ["title", "content", "page_type", "created_at", "updated_at"]
  end
end
