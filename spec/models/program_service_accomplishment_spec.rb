require 'rails_helper'

RSpec.describe ProgramServiceAccomplishment, type: :model do
  describe "attributes" do
    it { should have_db_column(:expense_amount) }
    it { should have_db_column(:grant_amount) }
    it { should have_db_column(:revenues) }
    it { should have_db_column(:description) }
    it { should have_db_column(:year) }
  end

  describe "associations" do
    it { should belong_to(:organisation) }
  end
end
