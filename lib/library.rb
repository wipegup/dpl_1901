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
end
