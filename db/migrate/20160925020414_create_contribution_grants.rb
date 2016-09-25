class CreateContributionGrants < ActiveRecord::Migration[5.0]
  def change
    create_table :contributiongrants do |t|
      t.integer :membership_fees
      t.integer :campaigns
      t.integer :fundraising
      t.integer :related_organisations
      t.integer :government_grants
      t.integer :other_gifts_or_donations
      t.integer :total

      t.timestamps
    end
  end
end
