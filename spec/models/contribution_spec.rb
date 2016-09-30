require 'rails_helper'

RSpec.describe Contribution, type: :model do
   describe "attributes" do
    it { should have_db_column(:membership_fees) }
    it { should have_db_column(:campaigns) }
    it { should have_db_column(:fundraising) }
    it { should have_db_column(:related_organisations) }
    it { should have_db_column(:government_grants) }
    it { should have_db_column(:other_gifts_or_donations) }
    it { should have_db_column(:total) }
  end

  describe "associations" do
    it { should have_one(:revenue) }
  end
end
