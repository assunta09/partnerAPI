class CreateBalances < ActiveRecord::Migration[5.0]
  def change
    create_table :balances do |t|
      t.organisation_id :integer
      t.year_id :integer
      t.total_assets :integer
      t.total_liabilities :integer
      t.net_assets :integer

      t.timestamps
    end
  end
end
