require './test/test_helper'
require './lib/author'

class AuthorTest < Minitest::Test
  def setup
    @author = Author.new({first_name: "N.K.",
      last_name: "Jemisin"})
  end

  def test_it_exists
    assert_instance_of Author, @author
  end

  def test_it_starts_with_empty_books_array
    assert_equal [], @author.books
  end
end
