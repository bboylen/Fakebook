class AddAuthorToPost < ActiveRecord::Migration[6.0]
  def change
    add_column :comments, :author_id, :integer, foreign_key: true
  end
end