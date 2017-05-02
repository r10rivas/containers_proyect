class CreateOrganizations < ActiveRecord::Migration[5.0]
  def change
    create_table :organizations do |t|
      t.references :company, foreign_key: true
      t.integer :kind_of_organization

      t.timestamps
    end
  end
end
