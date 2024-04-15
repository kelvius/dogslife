# frozen_string_literal: true

class CreatePayments < ActiveRecord::Migration[7.1]
  def change
    create_table :payments do |t|
      t.references :user, null: false, foreign_key: true
      t.references :dog, null: false, foreign_key: true
      t.string :payment_type
      t.integer :years_count
      t.decimal :amount
      t.string :status
      t.datetime :transaction_date

      t.timestamps
    end
  end
end
