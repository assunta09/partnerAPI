class CreateSalaries < ActiveRecord::Migration[5.0]
  def change
    create_table :salaries do |t|
      t.integer :officers_and_key_employees, default: 0
      t.integer :general_salaries_and_wages, default: 0
      t.integer :employee_benefits, default: 0
      t.integer :payroll_taxes, default: 0
      t.integer :other_compensation, default: 0
      t.integer :total, default: 0

      t.timestamps
    end
  end
end
