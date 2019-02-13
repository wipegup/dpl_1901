require './lib/book'
class Author
  attr_reader :books
  def initialize(info_hash)
    @books = []
    @author_first_name = info_hash[:first_name]
    @author_last_name = info_hash[:last_name]
  end

  def add_book(title, publication_date)
    book = Book.new({author_first_name: @author_first_name,
                    author_last_name: @author_last_name,
                    title: title,
                    publication_date: publication_date})

    @books << book
    book
  end
end
