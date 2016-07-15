class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.integer :author_id
      t.string :icon
      t.string :body
      t.datetime :created_at

      t.timestamps null: false
    end
  end
end
