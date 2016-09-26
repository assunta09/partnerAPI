class ChangeSalaryTable < ActiveRecord::Migration[5.0]
  def change
    add_column :salaries, :disqual_persons, :integer
    rename_column :salaries, :other_compensation, :pension_plan_accruals
  end
end
