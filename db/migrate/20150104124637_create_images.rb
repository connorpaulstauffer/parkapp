class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.string :image_file
      t.references :user, index: true

      t.timestamps null: false
    end
    add_index :images, [:user_id, :created_at]
  end
end
