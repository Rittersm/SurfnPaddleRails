class Post < ActiveRecord::Base

  belongs_to :author
  validates :title, presence: true
  validates :body, presence: true, length: {minimum: 200}
  validates :author, presence: true
  validates :icon, presence: true

end
