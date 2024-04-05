class CreateUsers < ActiveRecord::Migration[7.1]
  def change
    create_table :users do |t|
      t.string :username
      t.string :email
      t.integer :contact_number
      t.string :payment_type
      t.string :password_digest

      t.timestamps
    end
  end
end
