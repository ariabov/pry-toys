class Array
  def self.toy(n=10, type=Integer, &block)
    return Array.new(n,&block) if block_given?
    case type.to_s
    when 'Integer'
      Array.new(n) {|i| i+1}
    when 'Float'
      Array.new(n) {|i| i+1.0}
    when 'String'
      words = String.toy(n).split
      Array.new(n) {|i| words[i]}
    else
      raise ElseIsCalled
    end
  end
end

class Hash
  def self.toy(n=10)
    Hash[Array.toy(n) {|m| ('a'..'zz').to_a[m] }.zip(Array.toy(n))]
  end
end

class String
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