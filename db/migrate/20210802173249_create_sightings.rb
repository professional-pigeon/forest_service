class CreateSightings < ActiveRecord::Migration[5.2]
  def change
    create_table :sightings do |t|
      t.column(:latitude, :float)
      t.column(:longitude, :float)
      t.column(:date_of_sighting, :date)

      t.timestamps()
    end
  end
end
