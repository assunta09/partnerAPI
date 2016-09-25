class AddColumnsToOtherExpenses < ActiveRecord::Migration[5.0]
  def change
    add_column :otherexpenses, :management, :integer
    add_column :otherexpenses, :legal_fees, :integer
    add_column :otherexpenses, :accounting, :integer
    add_column :otherexpenses, :office_expenses, :integer
    add_column :otherexpenses, :information_technology, :integer
    add_column :otherexpenses, :royalties, :integer
    add_column :otherexpenses, :conventions_and_meetings, :integer
    add_column :otherexpenses, :occupancy, :integer

  end
end
