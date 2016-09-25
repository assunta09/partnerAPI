class ChangeRevenueColumnName < ActiveRecord::Migration[5.0]
  def change
    rename_column :revenues, :contributions, :contribution_grant_id
  end
end
