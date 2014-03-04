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
    n.times.map { alphabet.sample * rand(1..10) } * ' '
  end
end
