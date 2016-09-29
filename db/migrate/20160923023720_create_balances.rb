class CreateBalances < ActiveRecord::Migration[5.0]
  def change
    create_table :balances do |t|
      t.integer :organisation_id
      t.integer :year
      t.bigint :total_assets, default: 0
      t.bigint :total_liabilities, default: 0
      t.bigint :net_assets, default: 0

      t.timestamps
    end
  end
end
