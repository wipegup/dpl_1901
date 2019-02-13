require './lib/author'
require './lib/book'

class Library
  attr_reader :books
  def initialize
    @books = []
  end
end
