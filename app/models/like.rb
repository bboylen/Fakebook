class Like < ApplicationRecord
  belongs_to :user
  belongs_to :post

  def already_exists? 
    Like.where(user_id: self.user_id, post_id: self.post_id).exists?
  end
end
