class AddAnimalIdForSightings < ActiveRecord::Migration[5.2]
  def change
    add_column(:sightings, :animal_id, :integer)
  end
end
