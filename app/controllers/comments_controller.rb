class CommentsController < ApplicationController
  def index
    @body_class = 'normal-background'
    @comments = Comment.all
  end

  def new
    @body_class = 'normal-background'
    @comment = Comment.new
  end

  def create
    @body_class = 'normal-background'
    @comment = current_user.comments.create(comment_params)
    redirect_to posts_path
  end

  def show
    @body_class = 'normal-background'
    @comment = current_user.comments.find(params[:id])
  end

  def edit
    @body_class = 'normal-background'
    @comment = current_user.comments.find(params[:id])
    redirect_to @comment.post
  end

  def update
    @body_class = 'normal-background'
    @comment = current_user.comments.find(params[:id])
    @comment.update_attributes(comment_params)
    redirect_to @comments
  end

  def destroy
    current_user.comments.find(params[:id]).destroy
    redirect_to current_user
  end

  private
  def comment_params
    params.require(:comment).permit(:content, :post_id)
  end
end
