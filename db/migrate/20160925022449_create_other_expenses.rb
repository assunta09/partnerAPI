class CreateOtherExpenses < ActiveRecord::Migration[5.0]
  def change
    create_table :other_expenses do |t|
      t.integer :lobbying, default: 0
      t.integer :advertising_promotion, default: 0
      t.integer :travel, default: 0
      t.integer :entertainment, default: 0
      t.integer :insurance, default: 0
      t.integer :other, default: 0
      t.integer :total, default: 0

      t.timestamps
    end
  end
end
