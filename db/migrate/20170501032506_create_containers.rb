class CreateContainers < ActiveRecord::Migration[5.0]
  def change
    create_table :containers do |t|
      t.string :code
      t.integer :kind_of_container

      t.timestamps
    end
  end
end
