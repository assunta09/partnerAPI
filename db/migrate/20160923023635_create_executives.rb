class CreateExecutives < ActiveRecord::Migration[5.0]
  def change
    create_table :executives do |t|
      t.integer :organisation_id
      t.string :name
      t.integer :salary

      t.timestamps
    end
  end
end
