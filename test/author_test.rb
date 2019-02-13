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

  def test_it_can_add_books
    @author.add_book("The Fifth Season", "November 3, 2015")
    @author.add_book("The Hundred Thousand Kingdoms", "2010")

    assert_equal "N.K.", @author.books[0].author_first_name
    assert_equal "The Fifth Season", @author.books[0].title

    assert_equal "Jemisin", @author.books[1].author_last_name
    assert_equal "2010", @author.books[1].publication_date

  end
end
