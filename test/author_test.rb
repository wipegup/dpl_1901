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

end
