# -----------------------------------------------------------------------
# Stretch : multiple books, each with multiple chapters
# 1 - add book
# 2 - add chapters to each book
# 3 - show books
# 4 - show chapters of a certain book
# 5 - show books and chapters

class Book
  # attr_accessor :bookshelf

  def initialize
    @bookshelf ={}
    p '>>---------------------------<<'
  end

  def add_book(book_name)
    # create a key:value pair in the hash "bookshelf"
    # where key is the book name and value is an empty array
    @bookshelf[book_name] = []
  end

  def add_chapter(book_name, chapter_name)
    if !@bookshelf[book_name]
      p " This book does not exist. "
    else
      @bookshelf[book_name].push(chapter_name)
    end
  end

  def show_book
    @bookshelf.each_key do |book_name|
      p book_name
    end
  end

  def show_chapters(book_name)
    if !@bookshelf[book_name]
      p " This book does not exist. "
    else
      @bookshelf[book_name].each do |chapter|
        p chapter
      end
    end
  end

  def show_bookshelf
    @bookshelf.each do |book_name, chapter_arr|
      p "#{book_name}: #{chapter_arr.join(", ")}"
    end
  end

end

a = Book.new
a.add_book("Book1")
a.add_book("Book2")
a.add_book("Book3")
a.add_book("Book4")

a.show_book

a.add_chapter("Book1","1-1")
a.add_chapter("Book1","1-2")
a.add_chapter("Book1","1-3")

a.add_chapter("Book2","2-1")
a.add_chapter("Book2","2-2")

a.add_chapter("Book3","3-1")
a.add_chapter("Book3","3-2")

a.add_chapter("Book5","5-1")

a.show_chapters("Book1")
a.show_chapters("Book6")

a.show_bookshelf
