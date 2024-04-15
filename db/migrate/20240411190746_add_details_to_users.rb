# frozen_string_literal: true

class AddDetailsToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :address, :string
  end
end
