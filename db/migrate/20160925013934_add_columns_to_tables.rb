class AddColumnsToTables < ActiveRecord::Migration[5.0]
  def change
    add_column :organisations, :ein, :integer
    add_column :organisations, :masterfile_id, :integer
  end
end
