class Library

  attr_reader :name, :books, :authors, :checked_out_books

  def initialize(name)
    @name = name
    @books = []
    @authors = []
    @checked_out_books = []

  end

  def add_author(author)
    @author = author
    @authors << author
     author.books.each do |book|
      @books << book
     end
  end

  def publication_time_frame_for(author)

    publication_hash = {}
    years = []
        author.books.each do |book|
            # require 'pry'; binding.pry
          years << book.publication_year.to_i

        end
        publication_hash[:start] = years.min.to_s
        publication_hash[:end] = years.max.to_s

        return publication_hash
  end

  def checkout(book)
    if @books.include?(book)
     true
    else
      false
    end
  end
end
