class AddDogTypeToDogs < ActiveRecord::Migration[7.1]
  def change
    add_column :dogs, :dog_type, :string
  end
end
