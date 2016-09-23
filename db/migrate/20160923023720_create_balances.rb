class CreateBalances < ActiveRecord::Migration[5.0]
  def change
    create_table :balances do |t|
      t.integer :organisation_id
      t.integer :year_id
      t.integer :total_assets
      t.integer :total_liabilities
      t.integer :net_assets

      t.timestamps
    end
  end
end
