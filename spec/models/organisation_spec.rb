require 'rails_helper'

RSpec.describe Organisation, type: :model do
  let(:organisation) { build(:organisation) }
  let(:program_service_accomplishment) { build(:program_service_accomplishment)}
  let(:revenue) { build(:revenue)}

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

  describe "instance methods" do
    it "returns program service accomplishments in an array" do
      p_s_a = organisation.render_program_service_accomplishments
      p_s_a.each do |psa|
        expect(psa.class).to eq(ProgramServiceAccomplishment)
      end
    end
  end

end
