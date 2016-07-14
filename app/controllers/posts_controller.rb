class PostsController < ApplicationController

  def index
    @page_title = "Main Page"
    @posts = Post.all.order(created_at: :desc)
    @post_images = Post.all.order(created_at: :desc).limit(4)
  end

  def show
    @posts = Post.all.detect{|post| post.id == params[:id].to_i}
    @page_title = @posts.title
    @post_images = Post.all.order(created_at: :desc).where("id != ?", params[:id].to_i).limit(4)
  end

  def new
    @page_title = "Create New Post"
    @post = Post.new
    @post_images = Post.all.order(created_at: :desc).limit(4)
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to root_path
    else
      @post_images = Post.all.order(created_at: :desc).limit(4)
      render :new
    end
  end

  def edit
    @page_title = "Edit Your Post"
    @post = Post.find(params[:id])
    @post_images = Post.all.order(created_at: :desc).limit(4)
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to @post
    else
      render :edit
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :author_id, :icon, :body)
  end

end
