class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable 
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         :omniauthable
  has_many :posts

  has_many :friendships   
  has_many :friends,  through: :friendships                              
  
  has_many :inverse_friendships, class_name: "Friendship", foreign_key: "friend_id"
  has_many :inverse_friends, through: :inverse_friendships, source: :user
  
  validates :first_name, presence: true
  validates :last_name, presence: true
end
