class CreateTravels < ActiveRecord::Migration[5.0]
  def change
    create_table :travels do |t|
      t.string :cod_travel
      t.references :ship, foreign_key: true
      t.references :destination, index: true
      t.references :origin, index: true

      t.timestamps
    end
  end
end
