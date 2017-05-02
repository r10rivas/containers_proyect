class AddNvoccdToCompany < ActiveRecord::Migration[5.0]
  def change
    add_column :companies, :nvocc, :boolean
  end
end
