class RenameColumnCurrentOnTableAddresses < ActiveRecord::Migration[5.0]

  def up
    rename_column :addresses, :current?, :current
  end

  def down
    rename_column :addresses, :current, :current?
  end
end
