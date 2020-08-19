class FriendshipsController < ApplicationController
  before_action :authenticate_user!

  def index
    @user = User.find(params[:user_id])
    @friendships = @user.friends + @user.inverse_friends
    @friendships = @friendships.sort_by {|friend| friend.first_name}
    @friend_requests = @user.friend_requests_as_receiver
  end

  def create
    @friendship = Friendship.new(friendship_params)

    respond_to do |format|
      if @friendship.save
        format.html { redirect_to posts_path, notice: 'Post was successfully created.' }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @friendship.destroy
    respond_to do |format|
      format.html { redirect_to posts_url, notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    
    def friendship_params
      params.require(:friendship).permit(:friend_id, :user_id)
    end
end

