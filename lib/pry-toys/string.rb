##
# Reopening String class to add toy method
String.class_eval do

  ##
  # Creates a string with certain number of words. In this case,
  # words are random collection of letters (not actual words).
  #
  # For example
  #
  # String.toy(3) # => "mmmmmmmm xxxx hhhhhh"

  def self.toy(n=25)
    alphabet = ('a'..'z').to_a
    phrase = String.new
    i = 0
    while i < n do 
      phrase << ' ' unless i == 0
      phrase << alphabet[rand(alphabet.size)] * (rand(10) + 1)
      i += 1
    end
    phrase
  end
end