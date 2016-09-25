class CreateClassifications < ActiveRecord::Migration[5.0]
  def change
    create_table :classifications do |t|
      t.integer :subsection_code
      t.integer :classification_code
      t.text :description
    end
  end
end
