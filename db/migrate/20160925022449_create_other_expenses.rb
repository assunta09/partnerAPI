class CreateOtherExpenses < ActiveRecord::Migration[5.0]
  def change
    create_table :other_expenses do |t|
      t.integer :lobbying
      t.integer :advertising_promotion
      t.integer :travel
      t.integer :entertainment
      t.integer :insurance
      t.integer :other
      t.integer :total

      t.timestamps
    end
  end
end
