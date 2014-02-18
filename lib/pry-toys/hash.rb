class Hash
  def self.toy(n=10)
    range = toy_size(n).to_a
    Hash[Array.toy(n) {|m| range[m] }.zip(Array.toy(n))]
  end

  private

  def self.toy_size(n)
    Toy.hash_range_for(n)
  end
end
