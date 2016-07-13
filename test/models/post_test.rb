require 'test_helper'

class PostTest < ActiveSupport::TestCase

  test "save post without title" do
    post_test = Post.new
    refute post_test.save
    refute post_test.errors.blank?
  end

  test "body shorter than 150 characters" do
    short_post = Post.new(title: "test", body: "Hello there!")
    refute short_post.save
    refute short_post.errors.blank?
  end

  test "new post without associated author" do
    author_new = Author.new(name: 'Stand In')
    post_new = Post.new(title: "Filler", body: [1..150].join)
    refute post_new.save
    refute post_new.errors.blank?
    assert post_new.errors.messages.detect do |key, value|
      value.detect do |error|
        error.include? "author"
      end
    end
  end

end
