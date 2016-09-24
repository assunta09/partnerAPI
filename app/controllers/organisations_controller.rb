class OrganisationsController < ApplicationController
    def index
    @organisations = Organisation.all
    render json: {organisations: @organisations}
  end

  def show
    @organisation = Organisation.find(params[:id])
    @impact_score = @organisation.impact_score
    @general_expenses_overview = @organisation.general_expenses_overview
    render json: {organisation: @organisation, impactScore: @impact_score, generalExpensesOverview: @general_expenses_overview}
  end
end
