class Organisation < ApplicationRecord
  has_many :executives
  has_many :balances
  has_many :revenues
  has_many :expenses
  has_many :program_service_accomplishments
  belongs_to :masterfile

  # def impact_score
  #   total_expenses = expense_data.total
  #   admin_expenses = 0.00
  #   expense_data.attributes.each do |expense_type, value|
  #     if expense_type == 'other' || expense_type == 'member_benefits' || expense_type == 'salaries' || expense_type == 'fundraising_fees'
  #       if value != nil
  #         admin_expenses += value
  #       end
  #     end
  #   end
  #   1 - admin_expenses/total_expenses
  # end

  def general_expenses_percentages
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

  def general_expenses_absolutes
    expense_split = {}
    expense_data.attributes.each do |expense_type, value|
      if expense_type == 'other' || expense_type == 'member_benefits' || expense_type == 'salaries' || expense_type == 'fundraising_fees' || expense_type == 'grants'
        if value != nil
          expense_split[expense_type] = value
        end
      end
    end
    expense_split
  end

  def general_revenue_absolutes
    revenue_split = {}
    revenue_data.attributes.each do |revenue_type, value|
      if revenue_type == 'contributions' || revenue_type == 'service_revenue' || revenue_type == 'investments' || revenue_type == 'other'
        if value != nil
          revenue_split[revenue_type] = value
        end
      end
    end
    revenue_split
  end

  def expense_data
    expenses = Expense.where(organisation_id: self.id).first
  end

  def revenue_data
    revenues = Revenue.where(organisation_id: self.id).first
  end

end
