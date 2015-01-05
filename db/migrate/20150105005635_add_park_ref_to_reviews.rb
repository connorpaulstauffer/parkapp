class AddParkRefToReviews < ActiveRecord::Migration
  def change
    add_reference :reviews, :park, index: true
    add_foreign_key :reviews, :parks
  end
end
