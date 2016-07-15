class AuthorsController < ApplicationController

  def new
    @page_title = "Register New Author"
    @author = Author.new
    @post_images = Post.all.order(created_at: :desc).limit(4)
  end

  def create
    @author = Author.new(author_params)
    if @author.save
      redirect_to root_path
    else
      @post_images = Post.all.order(created_at: :desc).limit(4)
      render :new
    end
  end

  def author_params
    params.require(:author).permit(:name, :profile)
  end
end
