class CreatePayeeLocations < ActiveRecord::Migration[7.0]
  def change
    create_table :payee_locations do |t|
      t.string :uid
      t.string :latitude
      t.string :longitude
      t.boolean :deleted

      t.timestamps
    end
  end
end
