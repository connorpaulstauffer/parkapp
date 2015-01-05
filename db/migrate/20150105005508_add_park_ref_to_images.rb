class AddParkRefToImages < ActiveRecord::Migration
  def change
    add_reference :images, :park, index: true
    add_foreign_key :images, :parks
  end
end
