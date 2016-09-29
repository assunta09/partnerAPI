class Organisation < ApplicationRecord
  has_many :executives
  has_many :balances
  has_many :revenues
  has_many :expenses
  has_many :program_service_accomplishments
  belongs_to :masterfile

  def rendering
    organisation_data = self.attributes
    ['created_at', 'updated_at', 'ein','masterfile_id'].each do |item_to_delete|
      organisation_data.delete(item_to_delete)
    end
    organisation_data[:tax_year] = expense_data.year
    organisation_data
  end

  def fundraising_ratio
    fundraising_ratio = {fundraising_fees: expense_data.fundraising_fees.to_i, funds_raised: Contribution.find(revenue_data.contribution_id).fundraising.to_i}
  end

  def general_expenses_absolutes
    expense_split = {}
    expense_data.attributes.each do |expense_type, value|
      if expense_type == 'member_benefits' || expense_type == 'fundraising_fees'
        expense_split[expense_type] = value.to_i
      elsif expense_type == 'salary_id'
        salary_data = Salary.find(value)
        expense_split['salaries'] = salary_data.total.to_i
      elsif expense_type == 'grant_id'
        grant_data = Grant.find(value)
        expense_split['grant'] = grant_data.total.to_i
      elsif expense_type == 'other_expense_id'
        other_expenses_data = OtherExpense.find(value)
        expense_split['other_expenses'] = other_expenses_data.total.to_i
      end
    end
    expense_split
  end

  def general_revenue_absolutes
    revenue_split = {}
    revenue_data.attributes.each do |revenue_type, value|
      if revenue_type == 'service_revenue' || revenue_type == 'investments' || revenue_type == 'other'
        revenue_split[revenue_type] = value.to_i
      elsif revenue_type == "contribution_id"
        contribution_data = Contribution.find(value)
        revenue_split['contribution'] = contribution_data.total.to_i
      end
    end
    revenue_split
  end

  def other_expenses_absolutes
    other_expense_split = {}
    other_expense_data = OtherExpense.find(expense_data.other_expense_id)

    other_expense_data.attributes.each do |expense_type, value|
      if expense_type != 'total' && expense_type != 'id' && expense_type != 'created_at' && expense_type != 'updated_at'
          other_expense_split[expense_type] = value.to_i
      end
    end
    other_expense_split
  end

  def salaries_absolutes
    salary_split = {}
    salary_data = Salary.find(expense_data.salary_id)

    salary_data.attributes.each do |expense_type, value|
      if expense_type != 'total' && expense_type != 'id' && expense_type != 'created_at' && expense_type != 'updated_at'
        salary_split[expense_type] = value.to_i
      end
    end
    salary_split
  end

  def grants_absolutes
    grant_split = {}
    grant_data = Grant.find(expense_data.grant_id)

    grant_data.attributes.each do |expense_type, value|
      if expense_type != 'total' && expense_type != 'id' && expense_type != 'created_at' && expense_type != 'updated_at'
          grant_split[expense_type] = value.to_i
      end
    end
    grant_split
  end

  def contributions_absolutes
    contribution_split = {}
    contribution_data = Contribution.find(revenue_data.contribution_id)

    contribution_data.attributes.each do |revenue_type, value|
      if revenue_type != 'total' && revenue_type != 'id' && revenue_type != 'created_at' && revenue_type != 'updated_at'
        contribution_split[revenue_type] = value.to_i
      end
    end
    contribution_split
  end

  def revenues_split_absolutes
    array = [general_revenue_absolutes, contributions_absolutes]
    revenue_split = array.inject(:update)
    revenue_split.delete('contribution')
    revenue_split
  end

  def expenses_split_absolutes
    different_expense_types = [general_expenses_absolutes, salaries_absolutes, grants_absolutes, other_expenses_absolutes]
    expense_split = different_expense_types.inject(:update)
    ['salaries','grant', 'other_expenses'].each do |item_to_delete|
      expense_split.delete(item_to_delete)
    end
    expense_split
  end

  def top_salaries_absolutes
    exec_salaries = Executive.where(organisation_id: self.id)
    sort_salaries = exec_salaries.sort_by{|k| (k["salary"] + k["other_salary"])}.reverse
    top_salaries = []
    sort_salaries[0...3].each do |executive|
      total_salary = executive.salary + executive.other_salary
      if total_salary != 0
        top_salaries << {name: executive.name, title: executive.title, salary: total_salary}
      end
    end
    top_salaries
  end

  def render_program_service_accomplishments
    psa_get_data = ProgramServiceAccomplishment.where(organisation_id: self.id)
    program_service_accomplishments = []

    psa_get_data.each do |accomplishment|
      program_service_accomplishments << {
        expense_amount: accomplishment.expense_amount.to_i,
        grant_amount: accomplishment.grant_amount.to_i,
        revenues: accomplishment.revenues.to_i,
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
