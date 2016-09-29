class CreateBalances < ActiveRecord::Migration[5.0]
  def change
    create_table :balances do |t|
      t.integer :organisation_id
      t.integer :year
      t.bigint :total_assets
      t.bigint :total_liabilities
      t.bigint :net_assets

      t.timestamps
    end
  end
end
