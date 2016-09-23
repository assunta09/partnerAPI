class CreateRevenues < ActiveRecord::Migration[5.0]
  def change
    create_table :revenues do |t|
      t.organisation_id :integer
      t.year_id :integer
      t.contributions :integer
      t.service_revenues :integer
      t.investments :integer
      t.other :integer
      t.total :integer

      t.timestamps
    end
  end
end
