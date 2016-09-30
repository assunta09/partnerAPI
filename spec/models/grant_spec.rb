require 'rails_helper'

RSpec.describe Grant, type: :model do
  describe "attributes" do
    it { should have_db_column(:domestic_organisations) }
    it { should have_db_column(:domestic_individuals) }
    it { should have_db_column(:foreign_entities) }
    it { should have_db_column(:total) }
  end

  describe "associations" do
    it { should have_one(:expense) }
  end
end
