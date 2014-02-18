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
      Array.new(n) do 
        type.send(:new) rescue
          raise NoNewMethodError, 'Please provide Object that responds to `new` call'
      end
    end
  end
end
 

 