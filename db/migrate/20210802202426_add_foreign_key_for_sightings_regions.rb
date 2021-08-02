class AddForeignKeyForSightingsRegions < ActiveRecord::Migration[5.2]
  def change
    add_foreign_key :sightings, :regions
  end
end
