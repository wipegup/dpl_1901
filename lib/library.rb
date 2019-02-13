require './lib/author'
require './lib/book'

class Library
  attr_reader :books
  def initialize
    @books = []
  end

  def add_to_collection(book)
    @books << book
  end

  def include?(title)
    @books.any?{|book| book.title == title}
  end

  def card_catalog
    @books.sort_by{|book| book.author_last_name}
  end
end
