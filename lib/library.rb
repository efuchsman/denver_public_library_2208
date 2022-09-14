class Library

  attr_reader :name, :books, :authors, :checked_out_books, :most_popular_book

  def initialize(name)
    @name = name
    @books = []
    @authors = []
    @checked_out_books = []
    @book_popularity = Hash.new(0)
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
    if @checked_out_books.include?(book) || !@books.include?(book)
      false
    else
     @checked_out_books << book
     @book_popularity[book] += 1
    true
    end
  end

  def return(book)
    @checked_out_books.delete(book)
  end

  def most_popular_book
    @book_popularity.keys.max_by do |book|
      @book_popularity[book]
    end
  end

end
