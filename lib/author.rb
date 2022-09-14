class Author
attr_reader :first_name, :last_name, :books, :name

def initialize(atts)
  @first_name = atts[:first_name]
  @last_name = atts[:last_name]
  @books = []
  @name = "#{@first_name} #{last_name}"

end

end
