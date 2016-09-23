class OrganisationsController < ApplicationController
    def index
    @organisations = Organisation.all
  end

  def show
    @organisation = Organisation.find(params[:id])
    @impact_score = @organisation.impact_score
    render json: {organisation: @organisation, impact_score: @impact_score}
  end
end
