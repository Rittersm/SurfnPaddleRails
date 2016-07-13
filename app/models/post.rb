class Post < ActiveRecord::Base

  belongs_to :author
  validates :title, presence: true, length: {minimum: 200}
  validates_presence_of :author

end
