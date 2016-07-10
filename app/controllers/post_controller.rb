class PostController < ApplicationController

  def index
    @page_title = "Main Page"
    @posts = Post.all.sort_by{|post| post.created_at}.last
    @post_images = Post.all.sort_by{|image| image.created_at} - [@posts]
  end

  def show
    @posts = Post.all.detect{|post| post.id == params[:id].to_i}
    @page_title = @posts.title
    @post_images = Post.all.sort_by{|image| image.created_at} - [@posts]
  end

end
