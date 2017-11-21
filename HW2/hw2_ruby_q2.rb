# Question 2
# Build a Ruby class called Book. Objects of the Book class must have two attributes: title and chapters. Objects must have two methods: add_chapter and chapters. The add_chapter method adds a chapter by giving it a title. The chapters method should display the number of chapters and lists all the chapters as in:
#
# book = Book.new
# book.title = "My Awesome Book"
# book.add_chapter("My Awesome Chapter 1")
# book.add_chapter("My Awesome Chapter 2")
# book.chapters
# This should print:
# Your book: My Awesome Book has 2 chapters:
# 1. My Awesome Chapter 1
# 2. My Awesome Chapter 2
#-----------------------------------------------------------------------
# 1 - Didn't use initialize(title, chapters) because don't need to ask for
#     inputs when create a new instance
# 2 - Give title (Book name) a default value, which can be changed later
# 3 - Set chapters as an array to store multiple input values
# 4 - In the add_chapter method, push the new input to chapters array
# 5 - In chapters method, use .length to show the total of chapters;
#     use each_with_index to display an ordered list with the chapter name

class Book
  # attr_accessor :title

  def initialize
    @title = "My Awesome Book"
    @chapters = []
    p '>>>>>> Please enter a book title and its chapters<<<<<<'
  end

  def add_chapter(str)
    @chapters.push(str)
  end

  def chapters
    p "Your book: '#{@title}' has #{@chapters.length} chapters:"
     @chapters.each_with_index do |value, index|
      p "#{index+1}. #{value}"
    end
  end
end
# --------------------------------------------------------------------------
book = Book.new
book.title = "Language"
book.add_chapter("Chapter 1 - Ruby")
book.add_chapter("Chapter 2 - JavaScript")
# book.chapters = ["a","b"]
book.chapters
p book.title
