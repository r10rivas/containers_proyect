class CreateCompanies < ActiveRecord::Migration[5.0]
  def change
    create_table :companies do |t|
      t.string :name
      t.integer :kind_of_doc
      t.string :num_doc

      t.timestamps
    end
  end
end
