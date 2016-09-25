class CreateGrants < ActiveRecord::Migration[5.0]
  def change
    create_table :grants do |t|
      t.integer :domestic_organisations
      t.integer :domestic_individuals
      t.integer :foreign_entities
      t.integer :total

      t.timestamps
    end
  end
end
