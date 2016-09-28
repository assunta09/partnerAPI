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

  # def general_expenses_percentages
  #   percentages = {}
  #   expense_data.attributes.each do |expense_type, value|
  #     if expense_type == 'other' || expense_type == 'member_benefits' || expense_type == 'salaries' || expense_type == 'fundraising_fees' || expense_type == 'grants'
  #       if value != nil
  #         percentages[expense_type] = value.to_f/expense_data.total
  #       end
  #     end
  #   end
  #   percentages
  # end

  def fundraising_ratio
    fundraising_ratio = {fundraising_fees: expense_data.fundraising_fees, funds_raised: Contribution.find(revenue_data.contribution_id).fundraising}
  end

  def general_expenses_absolutes
    expense_split = {}
    expense_data.attributes.each do |expense_type, value|
      if expense_type == 'member_benefits' || expense_type == 'fundraising_fees'
        if value != nil
          expense_split[expense_type] = value
        end
      elsif expense_type == 'salary_id'
        salary_data = Salary.find(value)
        if salary_data.total != nil
          expense_split['salaries'] = salary_data.total
        end
      elsif expense_type == 'grant_id'
        grant_data = Grant.find(value)
        if grant_data.total != nil
          expense_split['grant'] = grant_data.total
        end
      elsif expense_type == 'other_expense_id'
        other_expenses_data = OtherExpense.find(value)
        if other_expenses_data.total != nil
          expense_split['other_expenses'] = other_expenses_data.total
        end
      end
    end
    expense_split
  end

  def general_revenue_absolutes
    revenue_split = {}
    revenue_data.attributes.each do |revenue_type, value|
      if revenue_type == 'service_revenue' || revenue_type == 'investments' || revenue_type == 'other'
        if value != nil
          revenue_split[revenue_type] = value
        end
      elsif revenue_type == "contribution_id"
        contribution_data = Contribution.find(value)
        if contribution_data.total
          revenue_split['contribution'] = contribution_data.total
        end
      end
    end
    revenue_split
  end

  def other_expenses_absolutes
    other_expense_split = {}
    other_expense_data = OtherExpense.find(expense_data.other_expense_id)

    other_expense_data.attributes.each do |expense_type, value|
      if expense_type != 'total' && expense_type != 'id' && expense_type != 'created_at' && expense_type != 'updated_at'
        if value != nil
          other_expense_split[expense_type] = value
        end
      end
    end
    other_expense_split
  end

  def salaries_absolutes
    salary_split = {}
    salary_data = Salary.find(expense_data.salary_id)

    salary_data.attributes.each do |expense_type, value|
      if expense_type != 'total' && expense_type != 'id' && expense_type != 'created_at' && expense_type != 'updated_at'
        if value != nil
          salary_split[expense_type] = value
        end
      end
    end
    salary_split
  end

  def grants_absolutes
    grant_split = {}
    grant_data = Grant.find(expense_data.grant_id)

    grant_data.attributes.each do |expense_type, value|
      if expense_type != 'total' && expense_type != 'id' && expense_type != 'created_at' && expense_type != 'updated_at'
        if value != nil
          grant_split[expense_type] = value
        end
      end
    end
    grant_split
  end

  def contributions_absolutes
    contribution_split = {}
    contribution_data = Contribution.find(revenue_data.contribution_id)

    contribution_data.attributes.each do |revenue_type, value|
      if revenue_type != 'total' && revenue_type != 'id' && revenue_type != 'created_at' && revenue_type != 'updated_at'
        if value != nil
          contribution_split[revenue_type] = value
        end
      end
    end
    contribution_split
  end

  def revenues_split_absolutes
    array = [general_revenue_absolutes, contributions_absolutes]
    variable = array.inject(:update)
    variable.delete('contribution')
    variable
  end

  def expenses_split_absolutes
    different_expense_types = [general_expenses_absolutes, salaries_absolutes, grants_absolutes, other_expenses_absolutes]
    variable = different_expense_types.inject(:update)
    ['salaries','grant', 'other_expenses'].each do |item_to_delete|
      variable.delete(item_to_delete)
    end
    variable
  end

  def top_salaries_absolutes
    exec_salaries = Executive.where(organisation_id: self.id)
    sort_salaries = exec_salaries.sort_by{|k| (k["salary"] + k["other_salary"])}.reverse
    top_salaries = []
    sort_salaries[0...3].each {|executive| top_salaries << {name: executive.name, salary: (executive.salary + executive.other_salary)} }
    top_salaries
  end

  def render_program_service_accomplishments
    psa_get_data = ProgramServiceAccomplishment.where(organisation_id: self.id)
    program_service_accomplishments = []

    psa_get_data.each do |accomplishment|
      program_service_accomplishments << {expense_amount: accomplishment.expense_amount,
        grant_amount: accomplishment.grant_amount,
        revenues: accomplishment.revenues,
        description: accomplishment.description}
    end
    program_service_accomplishments
  end

  private
  def expense_data
    expenses = Expense.where(organisation_id: self.id).first
  end

  def revenue_data
    revenues = Revenue.where(organisation_id: self.id).first
  end

end
