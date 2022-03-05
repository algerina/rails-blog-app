class ChangePostionsToPosts < ActiveRecord::Migration[7.0]
  def change
    rename_table :postions, :posts
  end
end
