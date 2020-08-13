class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :author, class_name: "User"
  validates :body, presence: true, length: { minimum: 1}
end
