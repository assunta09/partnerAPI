class ChangeColumnName < ActiveRecord::Migration[5.0]
  def change
    rename_column :expenses, :grants, :grant_id
    rename_column :expenses, :other, :other_expense_id
  end
end
