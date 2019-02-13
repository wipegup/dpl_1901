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

  def find_by_author(author)
    by_author = @books.find_all do |book|
      author == [book.author_first_name,book.author_last_name].join(" ")
    end

    make_title_hash(by_author)

  end

  def make_title_hash(book_array)
    title_hash = {}
    book_array.each do |book|
      title_hash[book.title] = book
    end

    return title_hash
  end
end
