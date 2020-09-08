class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy, :set_profile_picture]
  before_action :authenticate_user!

  def index
    @user = current_user
    @user_friends = @user.friends + @user.inverse_friends

    @pending_requests_receiver_ids = []
    @user.friend_requests_as_requestor.each do |request|
      @pending_requests_receiver_ids << request.receiver_id
    end

    @pending_requests_requestor_ids = []
    @user.friend_requests_as_receiver.each do |request|
      @pending_requests_requestor_ids << request.requestor_id
    end

    @user_not_friends = User.all 
    @user_not_friends = @user_not_friends.reject {|user| @user_friends.include?(user) || @pending_requests_requestor_ids.include?(user.id)}
    @user_not_friends.delete(@user)

    @friend_request = FriendRequest.new
    @friendship = Friendship.new
  end

  def show
    @posts = current_user.posts
  end

  def set_profile_picture
    @user.profile_picture.attach(params[:profile_picture])
    redirect_to user_path(@user)
  end

  private

    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.fetch(:user, {})
    end
end
