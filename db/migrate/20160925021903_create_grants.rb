class CreateGrants < ActiveRecord::Migration[5.0]
  def change
    create_table :grants do |t|
      t.integer :domestic_organisations, default: 0
      t.integer :domestic_individuals, default: 0
      t.integer :foreign_entities, default: 0
      t.integer :total, default: 0

      t.timestamps
    end
  end
end
