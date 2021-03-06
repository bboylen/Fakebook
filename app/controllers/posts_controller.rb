class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  def index
    friend_ids = current_user.friends.pluck(:id)
    friend_ids += current_user.inverse_friends.pluck(:id) 
    @posts = Post.where(:user_id => current_user.id).or(Post.where(:user_id => friend_ids)).order(created_at: :desc) 
  end
  
  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)

    respond_to do |format|
      if @post.save
        format.html { redirect_to posts_path, notice: 'Post was successfully created.' }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to @post, notice: 'Post was successfully updated.' }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url, notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def like
    like = Like.new(post_id: params[:id], user_id: params[:user_id])

    unless like.already_exists?
      like.save
      post = Post.find(params[:id])
      post.like_count += 1
      post.save
    end
    redirect_to posts_path
  end

  def unlike
    like = Like.where(post_id: params[:id], user_id: params[:user_id]).take

    if like
      like.destroy
      post = Post.find(params[:id])
      post.like_count -= 1
      post.save
    end

    redirect_to posts_path
  end

  private
    
    def set_post
      @post = Post.find(params[:id])
    end

    def post_params
      params.require(:post).permit(:body, :user_id)
    end
end
