class CreateDogLists < ActiveRecord::Migration[7.1]
  def change
    create_table :dog_lists do |t|
      t.references :dog, null: false, foreign_key: true
      t.string :pet_name
      t.string :breed
      t.text :information
      t.string :photo_url

      t.timestamps
    end
  end
end
