require './test/test_helper'
require './lib/library'
require './lib/author'
require './lib/book'

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

  def test_books_starts_empty
    assert_equal [], @library.books
  end

  def test_add_to_collection_adds_to_books
    @library.add_to_collection(@fifth_season)

    assert_equal [@fifth_season], @library.books

    @library.add_to_collection(@kingdoms)
    @library.add_to_collection(@mockingbird)

    assert_equal [@fifth_season, @kingdoms, @mockingbird], @library.books
  end

  def test_include_for_library
    @library.add_to_collection(@fifth_season)
    @library.add_to_collection(@kingdoms)
    @library.add_to_collection(@mockingbird)

    assert_equal true, @library.include?("To Kill a Mockingbird")
    assert_equal false, @library.include?("The Bible")
  end

  def test_card_catalog_returns_all_books_ordered_by_author_last_name
    @library.add_to_collection(@fifth_season)
    @library.add_to_collection(@kingdoms)
    @library.add_to_collection(@mockingbird)

    assert_equal [@fifth_season, @kingdoms, @mockingbird], @library.card_catalog
  end

  def test_make_title_hash_creates_hash
    expected = {"The Fifth Season" => @fifth_season,
                "The Hundred Thousand Kingdoms" => @kingdoms}
    assert_equal expected, @library.make_title_hash([@fifth_season, @kingdoms])
  end

  def test_find_by_author
    @library.add_to_collection(@fifth_season)
    @library.add_to_collection(@kingdoms)
    @library.add_to_collection(@mockingbird)

    expected = {"The Fifth Season" => @fifth_season,
                "The Hundred Thousand Kingdoms" => @kingdoms}

    assert_equal expected, @library.find_by_author("N.K. Jemisin")
  end

  def test_find_by_publication
    @library.add_to_collection(@fifth_season)
    @library.add_to_collection(@kingdoms)
    @library.add_to_collection(@mockingbird)

    expected ={"To Kill a Mockingbird" => @mockingbird}

    assert_equal expected, @library.find_by_publication("1960")
  end
end
