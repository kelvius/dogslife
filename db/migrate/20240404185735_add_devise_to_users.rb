# frozen_string_literal: true

class AddDeviseToUsers < ActiveRecord::Migration[7.1]
  def self.up
    change_table :users do |t|
      # Only add email and encrypted_password if they don't already exist
      t.string :email, null: false, default: '' unless column_exists?(:users, :email)

      t.string :encrypted_password, null: false, default: '' unless column_exists?(:users, :encrypted_password)

      # Add the rest of the Devise columns
      t.string   :reset_password_token
      t.datetime :reset_password_sent_at

      t.datetime :remember_created_at

      # Uncomment other Devise modules as needed
    end

    # Only add indexes if they don't already exist
    add_index :users, :email, unique: true unless index_exists?(:users, :email)

    return if index_exists?(:users, :reset_password_token)

    add_index :users, :reset_password_token, unique: true
  end

  def self.down
    # Customize the rollback as necessary; careful with removing columns if they were originally part of the app
    raise ActiveRecord::IrreversibleMigration
  end
end
