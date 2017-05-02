class CreateAddresses < ActiveRecord::Migration[5.0]
  def change
    create_table :addresses do |t|
      t.references :company, foreign_key: true
      t.references :country, foreign_key: true
      t.string :street
      t.string :description
      t.boolean :current?

      t.timestamps
    end
  end
end
