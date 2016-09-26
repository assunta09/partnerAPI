class OrganisationsController < ApplicationController
  def index
    @organisations = Organisation.all
    search_view = create_search_view(@organisations)
    render json: {organisations: search_view}
  end

  def show
    organisation = Organisation.find(params[:id])
    impact_score = organisation.impact_score
    general_expenses_percentages = organisation.general_expenses_percentages
    general_revenue_absolutes = organisation.general_revenue_absolutes
    render json: {organisation: organisation, impactScore: impact_score, generalExpensesOverview: general_expenses_percentages, generalRevenueAbsolutes: general_revenue_absolutes}
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
