# frozen_string_literal: true

class CreateReviews < ActiveRecord::Migration[7.1]
  def change
    create_table :reviews do |t|
      t.references :dog, null: false, foreign_key: true
      t.string :poster_name
      t.text :comment

      t.timestamps
    end
  end
end
