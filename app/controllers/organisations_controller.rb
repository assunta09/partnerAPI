class OrganisationsController < ApplicationController
  def index
    @organisations = Organisation.all
    render json: {organisations: @organisations}
  end

  def show
    organisation = Organisation.find(params[:id])
    impact_score = organisation.impact_score
    general_expenses_percentages = organisation.general_expenses_percentages
    general_revenue_absolutes = organisation.general_revenue_absolutes
    render json: {organisation: organisation, impactScore: impact_score, generalExpensesOverview: general_expenses_percentages, generalRevenueAbsolutes: general_revenue_absolutes}
  end
end
