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

    book_1 = Book.new({author_first_name: "N.K.",
                      author_last_name: "Jemisin",
                      title: "The Fifth Season",
                      publication_date: "November 3, 2015"})

    book_2 = Book.new({author_first_name: "N.K.",
                      author_last_name: "Jemisin",
                      title: "The Hundred Thousand Kingdoms",
                      publication_date: "2010"})

    assert_equal [book_1, book_2], @author.books
end
