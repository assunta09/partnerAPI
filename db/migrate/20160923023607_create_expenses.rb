class CreateExpenses < ActiveRecord::Migration[5.0]
  def change
    create_table :expenses do |t|
      t.integer :organisation_id
      t.integer :year
      t.integer :grants
      t.integer :member_benefits, default: 0
      t.integer :salaries
      t.integer :fundraising_fees, default: 0
      t.integer :other
      t.integer :total

      t.timestamps
    end
  end
end
