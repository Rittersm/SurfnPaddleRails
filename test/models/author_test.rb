require 'test_helper'

class AuthorTest < ActiveSupport::TestCase

  test "save author without name" do
    author_test = Author.new
    refute author_test.save
    refute author_test.errors.blank?
  end

end
