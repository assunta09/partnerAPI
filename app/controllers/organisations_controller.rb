class OrganisationsController < ApplicationController
  def index
    @organisations = Organisation.all
    search_view = create_search_view(@organisations)
    render json: {organisations: search_view}
  end

  def show
    organisation = Organisation.find(params[:id])
    # impact_score = organisation.impact_score
    general_expenses_absolutes = organisation.general_expenses_absolutes
    general_revenue_absolutes = organisation.general_revenue_absolutes
    all_expenses = organisation.all_expenses_absolutes
    all_revenues = organisation.all_revenues_absolutes
    fundraising_ratio = organisation.fundraising_ratio
    top_salaries = organisation.top_salaries_absolutes
    program_service_accomplishments = organisation.render_program_service_accomplishments
    render json: {organisation: organisation, generalExpensesAbsolutes: general_expenses_absolutes, generalRevenueAbsolutes: general_revenue_absolutes, allExpenses: all_expenses,
      allRevenues: all_revenues,
      fundraisingRatio: fundraising_ratio,
      topSalaries: top_salaries,
      programServiceAccomplishments: program_service_accomplishments
   }
  end

  private
  def create_search_view(organisations)
    search_view = {}
    organisations.each do |organisation|
      search_view[organisation.name] = organisation.id
    end
    search_view
  end


end
