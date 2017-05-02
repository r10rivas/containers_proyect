class CreateBlContainers < ActiveRecord::Migration[5.0]
  def change
    create_table :bl_containers do |t|
      t.references :bl_master, index: true
      t.references :bl_house, index: true
      t.references :container, foreign_key: true

      t.timestamps
    end
  end
end
