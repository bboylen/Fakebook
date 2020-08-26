class ChangeLikesOnPost < ActiveRecord::Migration[6.0]
  def change
    remove_column :posts, :likes 
    add_column :posts, :like_count, :integer, :default => 0
  end
end
