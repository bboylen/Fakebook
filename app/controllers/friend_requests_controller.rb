class FriendRequestsController < ApplicationController
  before_action :authenticate_user!

  def index
    @friend_requests = FriendRequest.all.order(created_at: :desc)
  end

  def create
    @friend_request = FriendRequest.new(friend_request_params)

    respond_to do |format|
      if @friend_request.save
        format.html { redirect_to posts_path, notice: 'Post was successfully created.' }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @friend_request.destroy
    respond_to do |format|
      format.html { redirect_to posts_url, notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    
    def friend_request_params
      params.require(:friend_request).permit(:requestor_id, :receiver_id)
    end

end
