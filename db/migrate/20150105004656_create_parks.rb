class CreateParks < ActiveRecord::Migration
  def change
    create_table :parks do |t|
      t.string :name
      t.string :state
      t.string :city

      t.timestamps null: false
    end
  end
end
