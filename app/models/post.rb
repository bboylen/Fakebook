class Post < ApplicationRecord
  belongs_to :author, class_name: "User", 
                      foreign_key: "user_id"
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
end
