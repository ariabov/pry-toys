String.class_eval do
  def self.toy(n=25)
    alphabet = ('a'..'z').to_a
    phrase = String.new
    i = 0
    while i < n do 
      phrase << alphabet[rand(alphabet.size)] * (rand(10) + 1)
      i += 1
      phrase << ' '
    end
    phrase
  end
end