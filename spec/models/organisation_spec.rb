require 'rails_helper'

RSpec.describe Organisation, type: :model do
  describe "attributes" do
    it { should have_db_column(:name) }
    it { should have_db_column(:mission) }
    it { should have_db_column(:address) }
    it { should have_db_column(:year_formed) }
    it { should have_db_column(:number_of_employees) }
    it { should have_db_column(:domain) }
    it { should have_db_column(:ein) }
    it { should have_db_column(:masterfile_id) }
  end

  describe "associations" do
    it { should have_many(:executives) }
    it { should have_many(:balances) }
    it { should have_many(:revenues) }
    it { should have_many(:expenses) }
    it { should have_many(:program_service_accomplishments) }
    it { should belong_to(:masterfile) }
  end

  describe "methods" do
    pending "Add tests to test for organisation methods"
  end
end
