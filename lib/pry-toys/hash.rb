##
# Reopening Array class to add toy method
Hash.class_eval do

  ##
  # Creates a hash with letters of alphabet as keys
  #
  # For example, it can be as small as 3
  #
  # Hash.toy(3) # => {a: 1, b: 2, c: 3}
  #
  # Or as large as 100000 (or larger)
  # 
  # h = Hash.toy(100000)
  # h.keys.last # => "eqxd"
  # h.values.last # => 100000
  # h # => {a: 1, ...., eqxd: 100000}

  def self.toy(n=10)
    range = toy_size(n).to_a
    Hash[Array.toy(n) {|m| range[m] }.zip(Array.toy(n))]
  end

  private

  def self.toy_size(n)
    Toy.hash_range_for(n)
  end
end
