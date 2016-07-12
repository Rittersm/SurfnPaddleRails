class PostController < ApplicationController

  def index
    @page_title = "Main Page"
    @posts = Post.all.order(created_at: :desc).first
    @post_images = Post.all.order(created_at: :desc).offset(1)
  end

  def show
    @posts = Post.all.detect{|post| post.id == params[:id].to_i}
    @page_title = @posts.title
    @post_images = Post.all.order(created_at: :desc).where("id != ?", params[:id].to_i)
  end

end
