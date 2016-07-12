class Post < ActiveRecord::Base

  belongs_to :author
  validates_presence_of :title
  validates_length_of :body, minimum: 150

end
