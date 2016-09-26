class ChangeRevenueColumnName < ActiveRecord::Migration[5.0]
  def change
    rename_column :revenues, :contributions, :contributiongrants_id
  end
end
