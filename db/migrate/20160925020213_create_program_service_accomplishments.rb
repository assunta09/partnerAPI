class CreateProgramServiceAccomplishments < ActiveRecord::Migration[5.0]
  def change
    create_table :program_service_accomplishments do |t|
      t.integer :organisation_id
      t.integer :expense_amount, default: 0
      t.integer :grant_amount, default: 0
      t.integer :revenues, default: 0
      t.text :description
      t.integer :year

      t.timestamps
    end
  end
end
