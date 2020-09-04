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

    @user_not_friends = User.all # Think of a more efficient way to do this?
    @user_not_friends = @user_not_friends.reject {|user| @user_friends.include?(user) || @pending_requests_requestor_ids.include?(user.id)}
    @user_not_friends.delete(@user)

    @friend_request = FriendRequest.new
    @friendship = Friendship.new
  end

  def show
    @posts = current_user.posts
  end

  def new
    @user = User.new
  end

  def edit
  end

  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
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
