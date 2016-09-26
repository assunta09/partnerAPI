class CreateSalaries < ActiveRecord::Migration[5.0]
  def change
    create_table :salaries do |t|
      t.integer :officers_and_key_employees
      t.integer :comp_to_disqual_persons
      t.integer :general_salaries_and_wages
      t.integer :pension_plan_accruals
      t.integer :employee_benefits
      t.integer :payroll_taxes
      t.integer :total

      t.timestamps
    end
  end
end
