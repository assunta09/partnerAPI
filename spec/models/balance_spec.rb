require 'rails_helper'

RSpec.describe Balance, type: :model do
  describe "attributes" do
    it { should have_db_column(:year) }
    it { should have_db_column(:total_assets) }
    it { should have_db_column(:total_liabilities) }
    it { should have_db_column(:net_assets) }
  end

  describe "associations" do
    it { should belong_to(:organisation) }
  end
end
