class ChangeExpenseColumn < ActiveRecord::Migration[5.0]
  def change
    rename_column :expenses, :salaries, :salary_id
  end
end
