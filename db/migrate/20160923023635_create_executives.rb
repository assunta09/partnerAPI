class CreateExecutives < ActiveRecord::Migration[5.0]
  def change
    create_table :executives do |t|
      t.integer :organisation_id
      t.string :name
      t.string :title
      t.integer :salary, default: 0

      t.timestamps
    end
  end
end
