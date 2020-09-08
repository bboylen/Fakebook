class FriendshipsController < ApplicationController
  before_action :authenticate_user!

  def create
    @friendship = Friendship.new(friendship_params)

    respond_to do |format|
      if @friendship.save
        @friend_request = FriendRequest.find(params[:request_id])
        @friend_request.destroy
        format.html { redirect_to friends_path, notice: 'Friend request accepted.'}
      else
        format.html { redirect_to friends_path }
        format.json { render json: @friendship.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @friendship.destroy
    respond_to do |format|
      format.html { redirect_to friends_path, notice: 'Unfriend complete.' }
      format.json { head :no_content }
    end
  end

  private
    
    def friendship_params
      params.require(:friendship).permit(:friend_id, :user_id)
    end
end

