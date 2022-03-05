class CreatePostion < ActiveRecord::Migration[7.0]
  def change
    create_table :postions do |t|
      t.string :title
      t.text :text
      t.integer :likes_counter
      t.integer :comments_counter

      t.timestamps
    end
  end
end
