class Book
  attr_reader :author_first_name, :author_last_name,
              :title, :publication_date
  def initialize(info_hash)
    @author_first_name = info_hash[:author_first_name]
    @author_last_name = info_hash[:author_last_name]
    @title = info_hash[:title]
    @publication_date = info_hash[:publication_date][-4..-1]
  end


end
