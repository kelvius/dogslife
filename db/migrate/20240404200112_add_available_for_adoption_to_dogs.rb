class AddAvailableForAdoptionToDogs < ActiveRecord::Migration[7.1]
  def change
    add_column :dogs, :available_for_adoption, :boolean, default: true
  end
end
