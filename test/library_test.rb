require './test/test_helper'

class LibraryTest < Minitest::Test
  def setup
    @nk_jemisin = Author.new({first_name: "N.K.", last_name: "Jemisin"})
    @fifth_season = @nk_jemisin.add_book("The Fifth Season", "November 3, 2015")
    @kingdoms = @nk_jemisin.add_book("The Hundred Thousand Kingdoms", "2010")

    @h_lee = Author.new({first_name: "Harper", last_name: "Lee"})
    @mockingbird = @h_lee.add_book("To Kill a Mockingbird", "July 11, 1960")

    @library = Library.new
  end

  def test_it_exists
    assert_instance_of Library, @library
  end

end
