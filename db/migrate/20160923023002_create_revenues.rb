class CreateRevenues < ActiveRecord::Migration[5.0]
  def change
    create_table :revenues do |t|
      t.integer :organisation_id
      t.integer :year
      t.integer :contribution_id
      t.integer :service_revenue
      t.integer :investments
      t.integer :other
      t.integer :total

      t.timestamps
    end
  end
end
