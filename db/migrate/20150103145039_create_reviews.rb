class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.text :content
      t.references :user, index: true

      t.timestamps null: false
    end
    add_index :reviews, [:user_id, :created_at]
  end
end
