class AddColumnsToOtherExpenses < ActiveRecord::Migration[5.0]
  def change
    add_column :other_expenses, :management, :integer, default: 0
    add_column :other_expenses, :legal_fees, :integer, default: 0
    add_column :other_expenses, :accounting, :integer, default: 0
    add_column :other_expenses, :office_expenses, :integer, default: 0
    add_column :other_expenses, :information_technology, :integer, default: 0
    add_column :other_expenses, :royalties, :integer, default: 0
    add_column :other_expenses, :conventions_and_meetings, :integer, default: 0
    add_column :other_expenses, :occupancy, :integer, default: 0

  end
end
