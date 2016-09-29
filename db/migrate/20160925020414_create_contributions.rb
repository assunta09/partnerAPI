class CreateContributions < ActiveRecord::Migration[5.0]
  def change
    create_table :contributions do |t|
      t.integer :membership_fees
      t.integer :campaigns
      t.integer :fundraising, default: 0
      t.integer :related_organisations, default: 0
      t.integer :government_grants, default: 0
      t.integer :other_gifts_or_donations, default: 0
      t.integer :total, default: 0

      t.timestamps
    end
  end
end
