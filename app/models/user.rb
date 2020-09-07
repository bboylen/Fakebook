class User < ApplicationRecord
  before_save :capitalize_names
  after_create :send_welcome_email
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable
         
  has_many :posts, dependent: :destroy
  has_many :comments, foreign_key: "author_id", dependent: :destroy
  has_many :likes, dependent: :destroy

  has_many :friendships, dependent: :destroy   
  has_many :friends,  through: :friendships                              
  
  has_many :inverse_friendships, class_name: "Friendship", foreign_key: "friend_id", dependent: :destroy
  has_many :inverse_friends, through: :inverse_friendships, source: :user
  
  has_many :friend_requests_as_receiver, class_name: "FriendRequest", foreign_key: "receiver_id", dependent: :destroy
  has_many :friend_requests_as_requestor, class_name: "FriendRequest", foreign_key: "requestor_id", dependent: :destroy

  has_one_attached :profile_picture
  
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, uniqueness: true

  devise :omniauthable, :omniauth_providers => [:facebook]

  def capitalize_names
    self.first_name = first_name.camelcase
    self.last_name = last_name.camelcase
  end

  def likes?(post)
    self.likes.any? {|like| like.post_id == post.id}
  end

  def self.new_with_session(params, session)
    super.tap do |user|
      if data = session['devise.facebook_data'] && session['devise.facebook_data']['extra']['raw_info']
        user.email = data['email'] if user.email.blank?
      end
      end
    end

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
      user.first_name = auth.info.name.split.first
      user.last_name = auth.info.name.split.last 
     # user.profile_picture.attach(auth.info.image) # assuming the user model has an image
    end
  end

  private

  def send_welcome_email
    UserMailer.welcome_email(self).deliver
  end
  
end
