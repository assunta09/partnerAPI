class CreateSalaries < ActiveRecord::Migration[5.0]
  def change
    create_table :salaries do |t|
      t.integer :officers_and_key_employees
      t.integer :general_salaries_and_wages
      t.integer :employee_benefits
      t.integer :payroll_taxes
      t.integer :other_compensation
      t.integer :total

      t.timestamps
    end
  end
end
