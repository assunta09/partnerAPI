class CreateExpenses < ActiveRecord::Migration[5.0]
  def change
    create_table :expenses do |t|
      t.organisation_id :integer
      t.year_id :integer
      t.grants :integer
      t.member_benefits :integer
      t.salaries :integer
      t.fundraising_fees :integer
      t.other :integer
      t.total :integer

      t.timestamps
    end
  end
end
