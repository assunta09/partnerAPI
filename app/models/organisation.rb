class Organisation < ApplicationRecord
  has_many :executives
  has_many :balances
  has_many :revenues
  has_many :expenses

  def impact_score
    total_expenses = expense_data.total
    admin_expenses = 0.00
    expense_data.attributes.each do |expense_type, value|
      if expense_type == 'other' || expense_type == 'member_benefits' || expense_type == 'salaries' || expense_type == 'fundraising_fees'
        if value != nil
          admin_expenses += value
        end
      end
    end
    1 - admin_expenses/total_expenses
  end

  def general_expenses_overview
    percentages = {}
    expense_data.attributes.each do |expense_type, value|
      if expense_type == 'other' || expense_type == 'member_benefits' || expense_type == 'salaries' || expense_type == 'fundraising_fees' || expense_type == 'grants'
        if value != nil
          percentages[expense_type] = value.to_f/expense_data.total
        end
      end
    end
    percentages
  end



  def expense_data
    expenses = Expense.where(organisation_id: self.id).first
  end


end
