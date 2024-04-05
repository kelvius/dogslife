class CreateDogs < ActiveRecord::Migration[7.1]
  def change
    create_table :dogs do |t|
      t.string :name
      t.text :breed
      t.text :story
      t.string :photo_url
      t.decimal :price

      t.timestamps
    end
  end
end
