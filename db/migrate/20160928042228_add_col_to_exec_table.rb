class AddColToExecTable < ActiveRecord::Migration[5.0]
  def change
    add_column :executives, :other_salary, :integer
  end
end
