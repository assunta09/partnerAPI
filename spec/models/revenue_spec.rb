require 'rails_helper'

RSpec.describe Revenue, type: :model do
  describe "attributes" do
    it { should have_db_column(:year) }
    it { should have_db_column(:service_revenue) }
    it { should have_db_column(:investments) }
    it { should have_db_column(:other) }
    it { should have_db_column(:total) }
  end

  describe "associations" do
    it { should belong_to(:organisation) }
    it { should belong_to(:contribution) }
  end
end
