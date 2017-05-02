class CreateBls < ActiveRecord::Migration[5.0]
  def change
    create_table :bls do |t|
      t.string :cod_bl
      t.references :organization, foreign_key: true
      t.references :consignee, index: true
      t.references :origin, index: true
      t.references :destination, index: true
      t.date :date_arrive
      t.boolean :is_master, default: false
      t.references :bl_master, index: true
      t.references :travel, foreign_key: true

      t.timestamps
    end
  end
end
