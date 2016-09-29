class OrganisationsController < ApplicationController
  def index
    @organisations = Organisation.all
    search_view = create_search_view(@organisations)
    render json: {organisations: search_view}
  end

  def show
    organisation = Organisation.find(params[:id])

    render json: {organisation: organisation.rendering,
      generalExpensesAbsolutes: organisation.general_expenses_absolutes,
      generalRevenueAbsolutes: organisation.general_revenue_absolutes,
      allExpenses: organisation.expenses_split_absolutes,
      allRevenues: organisation.revenues_split_absolutes,
      fundraisingRatio: organisation.fundraising_ratio,
      topSalaries: organisation.top_salaries_absolutes,
      programServiceAccomplishments: organisation.render_program_service_accomplishments
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
