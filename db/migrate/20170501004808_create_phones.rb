class CreatePhones < ActiveRecord::Migration[5.0]
  def change
    create_table :phones do |t|
      t.references :company, foreign_key: true
      t.integer :num_phone

      t.timestamps
    end
  end
end
