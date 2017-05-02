class RemoveKindOfOrganizationFromTableOrganization < ActiveRecord::Migration[5.0]
  def change
    remove_column :organizations, :kind_of_organization, :integer
  end
end
