require 'rails_helper'

RSpec.describe OrganisationsController, type: :controller do
  describe "GET index" do
    it "assignes @organisation" do
      organisations = Organisation.all
      get :index
      expect(assigns(:organisations)).to eq(organisations)
    end
  end

  describe "GET show" do
    it "assignes @organisation" do
      organisation = create(:organisation)
      get :show, id: organisation
      expect(assigns(:organisation)).to eq(organisation)
    end
  end
end
