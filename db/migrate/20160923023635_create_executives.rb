class CreateExecutives < ActiveRecord::Migration[5.0]
  def change
    create_table :executives do |t|
      t.organisation_id :integer
      t.name :string
      t.salary :integer

      t.timestamps
    end
  end
end
