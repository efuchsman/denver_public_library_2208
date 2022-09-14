class Author
attr_reader :first_name, :last_name, :books, :name, :written_book

  def initialize(atts)
    @first_name = atts[:first_name]
    @last_name = atts[:last_name]
    @books = []
    @name = "#{@first_name} #{last_name}"

  end

  def write(title, publication_date)
    written_book = Book.new(({author_first_name: @author_first_name, author_last_name: @author_last_name, title: title, publication_date: publication_date}))

      @books << written_book
      return written_book

      end


end
