# frozen_string_literal: true

class PageContent < ApplicationRecord
  def self.ransackable_attributes(_auth_object = nil)
    %w[title content page_type created_at updated_at]
  end
end
