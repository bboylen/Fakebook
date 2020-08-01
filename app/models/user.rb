class User < ApplicationRecord
  before_save :capitalize_names
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         :omniauthable
         
  has_many :posts

  has_many :friendships   
  has_many :friends,  through: :friendships                              
  
  has_many :inverse_friendships, class_name: "Friendship", foreign_key: "friend_id"
  has_many :inverse_friends, through: :inverse_friendships, source: :user
  
  has_many :friend_requests_as_receiver, class_name: "FriendRequest", foreign_key: "receiver_id"
  has_many :friend_requests_as_requestor, class_name: "FriendRequest", foreign_key: "requestor_id"

  validates :first_name, presence: true
  validates :last_name, presence: true

  def capitalize_names
    self.first_name = first_name.camelcase
    self.last_name = last_name.camelcase
  end
end
