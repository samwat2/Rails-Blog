class PostsController < ApplicationController
  def index
    @body_class = 'normal-background'
    @posts = Post.all
  end

  def new
    @body_class = 'normal-background'
    @post = Post.new
  end

  def create
    @body_class = 'normal-background'
    @post = current_user.posts.create(post_params)
    redirect_to @post
  end

  def show
    @body_class = 'normal-background'
    @post = current_user.posts.find(params[:id])
  end

  def edit
    @body_class = 'normal-background'
    @post = current_user.posts.find(params[:id])
  end

  def update
    @body_class = 'normal-background'
    @post = current_user.posts.find(params[:id])
    @post.update_attributes(post_params)
    redirect_to @post
  end

  def destroy
    current_user.posts.find(params[:id]).destroy
    redirect_to current_user
  end

  private
  def post_params
   params.require(:post).permit(:content) 
  end
end
