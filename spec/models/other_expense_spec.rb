require 'rails_helper'

RSpec.describe OtherExpense, type: :model do
  describe "attributes" do
    it { should have_db_column(:lobbying) }
    it { should have_db_column(:advertising_promotion) }
    it { should have_db_column(:travel) }
    it { should have_db_column(:entertainment) }
    it { should have_db_column(:insurance) }
    it { should have_db_column(:management) }
    it { should have_db_column(:legal_fees) }
    it { should have_db_column(:accounting) }
    it { should have_db_column(:office_expenses) }
    it { should have_db_column(:information_technology) }
    it { should have_db_column(:royalties) }
    it { should have_db_column(:conventions_and_meetings) }
    it { should have_db_column(:occupancy) }
    it { should have_db_column(:other) }
    it { should have_db_column(:total) }
  end

  describe "associations" do
    it { should have_one(:expense) }
  end
end
