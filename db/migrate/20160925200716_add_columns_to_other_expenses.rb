class AddColumnsToOtherExpenses < ActiveRecord::Migration[5.0]
  def change
    add_column :other_expenses, :management, :integer
    add_column :other_expenses, :legal_fees, :integer
    add_column :other_expenses, :accounting, :integer
    add_column :other_expenses, :office_expenses, :integer
    add_column :other_expenses, :information_technology, :integer
    add_column :other_expenses, :royalties, :integer
    add_column :other_expenses, :conventions_and_meetings, :integer
    add_column :other_expenses, :occupancy, :integer

  end
end
