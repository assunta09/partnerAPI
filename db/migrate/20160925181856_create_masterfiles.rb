class CreateMasterfiles < ActiveRecord::Migration[5.0]
  def change
    create_table :masterfiles do |t|
      t.integer :ein
      t.integer :subsection_code
      t.integer :classification_codes
      t.integer :classification_id
      t.integer :affiliation_code
      t.integer :activity_codes
      t.integer :organization_code
    end
  end
end
