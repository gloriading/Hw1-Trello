# Question 1
# Implement the following code in Ruby: Create a module called HelperMethods that include a method called titleize that does the following: it takes in a string and returns the string back after capitalizing each word in that string. For example, if you pass to the method a string "hello world" you should get back "Hello World". The methods should not capitalize the following words: in, the, of, and, or, from. Then write a piece of code to demonstrate the difference between include and extend in using Ruby modules with classes to include methods. Make sure to demonstrate calling the titleize methods with your code.
#-----------------------------------------------------------------------
# 1 - decide words that should not capotalize, put into an array: "no_cap"
# 2 - take a string as input, split it into an array -"revised" array
# 3 - use map to examine the elements in the revised array
# 4 - if "no_cap" array includes a word , the word stays the same
# 5 - if "no_cap" array does not include a word, capitalize that word
# 6 - join the revised array to a sentence
#-----------------------------------------------------------------------
module HelperMethods

  def titleize(str)
      no_cap = ["in","the","of","and","or","from","to","a","an","but","for"]
      result = str.split(" ").map {|word|
        if no_cap.include?(word)
          word
        else
          word.capitalize
        end
      }.join(" ")
      result
  end

end

class WithInclude
  include HelperMethods
end

class WithExtend
    extend HelperMethods
end


# include will bring the methods from the module as instance methods
c = WithInclude.new
p c.titleize("Imprisoned, the almighty Thor finds himself in a lethal gladiatorial contest against the Hulk, his former ally.")
# extend will bring the methods from the module as class methods
p WithExtend.titleize("Imprisoned, the almighty Thor finds himself in a lethal gladiatorial contest against the Hulk, his former ally.")

# Stretch -------------------------------------------------------------------
# if no_cap is the first word of the string, still capitalize it.
# in other words, capitalize the first word of a string no matter what
#---------------------------------------------------------------------------
# 1 - split the string to (str_arr), take the first word of the string array ("shift")
#     and capitalize it. Now str_arr_first is a capitalized word, and str_arr is an
#     array without the first word
# 2 - go throught the capitalize step, and join it to a string
# 3 - joing them by (string + string )

str = "the almighty Thor finds himself in a lethal gladiatorial contest against the Hulk, his former ally."

  def titleize(str)
      no_cap = ["in","the","of","and","or","from","to","a","an","but","for"]
      str_arr = str.split(" ")
      str_arr_first = str_arr.shift.capitalize

      rest = str_arr.map {|word|
        if no_cap.include?(word)
          word
        else
          word.capitalize
        end
      }.join(" ")
      str_arr_first + " " + rest
  end

  titleize(str)
# Result: "The Almighty Thor Finds Himself in a Lethal Gladiatorial Contest Against the Hulk, His Former Ally."
# note that only the first "The" is capitalized but the not the other "the"
