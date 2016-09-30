require 'rails_helper'

RSpec.describe Salary, type: :model do
  describe "attributes" do
    it { should have_db_column(:officers_and_key_employees) }
    it { should have_db_column(:general_salaries_and_wages) }
    it { should have_db_column(:employee_benefits) }
    it { should have_db_column(:payroll_taxes) }
    it { should have_db_column(:disqual_persons) }
    it { should have_db_column(:pension_plan_accruals) }
    it { should have_db_column(:total) }

  end

  describe "associations" do
    it { should have_one(:expense) }
  end
end
