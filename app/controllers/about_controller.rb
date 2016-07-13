class AboutController < ApplicationController

  def info
    @page_title = "About Page"
    @post_images = Post.all.order(created_at: :desc).offset(1).limit(4)
  end

end
