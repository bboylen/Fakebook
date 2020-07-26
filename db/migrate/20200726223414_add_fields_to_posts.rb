class AddFieldsToPosts < ActiveRecord::Migration[6.0]
  def change
    add_column :posts, :body, :text
    add_column :posts, :likes, :integer
    add_column :posts, :user_id, :integer, index: true, foreign_key: true
  end
end
