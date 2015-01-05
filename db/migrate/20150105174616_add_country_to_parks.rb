class AddCountryToParks < ActiveRecord::Migration
  def change
    add_column :parks, :country, :string
    remove_column :parks, :city
  end
end
