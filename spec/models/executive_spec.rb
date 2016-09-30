require 'rails_helper'

RSpec.describe Executive, type: :model do
  describe "attributes" do
    it { should have_db_column(:name) }
    it { should have_db_column(:title) }
    it { should have_db_column(:salary) }
    it { should have_db_column(:other_salary) }
  end

  describe "associations" do
    it { should belong_to(:organisation) }
  end
end
