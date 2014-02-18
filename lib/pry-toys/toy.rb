class Toy
  class << self
    def hash_range_for(n)
      range = nil
      i = 0
      until range != nil do
        range = ('a'..'z') if n <= 26
        range = ('a'.."z#{'z'*i}") if n < (26 + (26 ** (i+1) )) && !range
        i += 1
      end
      range
    end
  end
end

class NoNewMethodError < Exception; end