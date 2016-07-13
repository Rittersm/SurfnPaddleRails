class AboutController < ApplicationController

  def info
    @page_title = "About Page"
    @post_images = Post.all.order(created_at: :desc).limit(4)
  end

end
