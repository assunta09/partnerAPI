class CreateMasterfiles < ActiveRecord::Migration[5.0]
  def change
    create_table :masterfiles do |t|



      t.timestamps
    end
  end
end
