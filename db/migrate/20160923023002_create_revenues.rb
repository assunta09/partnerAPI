class CreateRevenues < ActiveRecord::Migration[5.0]
  def change
    create_table :revenues do |t|
      t.integer :organisation_id
      t.integer :year
      t.integer :contribution_id
      t.integer :service_revenue, default: 0
      t.integer :investments, default: 0
      t.integer :other, default: 0
      t.integer :total, default: 0

      t.timestamps
    end
  end
end
