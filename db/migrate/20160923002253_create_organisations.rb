class CreateOrganisations < ActiveRecord::Migration[5.0]
  def change
    create_table :organisations do |t|
      t.string :name
      t.text :mission
      t.string :address
      t.integer :year_formed
      t.integer :number_of_employees
      t.string :domain

      t.timestamps
    end
  end
end
