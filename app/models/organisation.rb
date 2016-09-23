class Organisation < ApplicationRecord
  has_many :executives
  has_many :balances
  has_many :revenues
  has_many :expenses

  def impact_score
    expenses = Expense.where(organisation_id: self.id).first
    # total_expenses = expenses.total
    # admin_expenses = 0
    # expenses.each do |expense_type, value|
    #   # if expense_type != 'other'
    #   #   admin_expenses += value
    #   # end
    # end

    # return admin_expenses
  end

end
