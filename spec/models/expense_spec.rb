require 'rails_helper'

RSpec.describe Expense, type: :model do
  describe "attributes" do
    it { should have_db_column(:year) }
    it { should have_db_column(:member_benefits) }
    it { should have_db_column(:fundraising_fees) }
    it { should have_db_column(:total) }
  end

  describe "associations" do
    it { should belong_to(:organisation) }
    it { should belong_to(:grant) }
    it { should belong_to(:other_expense) }
    it { should belong_to(:salary) }
  end
end
