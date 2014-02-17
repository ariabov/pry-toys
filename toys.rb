Pry.config.hooks.add_hook(:before_session, :say_hi) do
  # Can add array here
end

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
    when 'Time'
      time_now = Time.now
      Array.new(n) {|i| time_now + (i * (60 * 60 * 24)) }
    when 'Date'
      date_now = Date.today
      Array.new(n) {|i| date_now + (i * 1) }
    else
      Array.new(n) { type.send(:new) }
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