class CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    @comment = Comment.new(post_id: params[:post_id], body: params[:body])

    respond_to do |format|
      if @comment.save
        format.html { redirect_to root_path, notice: 'Comment was successfully created.' }
        format.json { render json: @comment}
      else
        format.html { redirect_to root_path }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
  end

  private 

end
