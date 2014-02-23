##
# Reopening Array class to add toy method
Array.class_eval do

  ##
  # Creates an array of objects based on the input
  # 
  # For example, it will work with the following inputs:
  #
  # == Size
  #
  # String.toy(3) # => [1, 2, 3]
  #
  # == Size & block
  #
  # String.toy(3) {|i| i + 3} # => [3, 6, 9]
  #
  # == Size & one of the pre-determined objects, such as
  # Integer (default), Float, String, Time, Date
  #
  # String.toy(3, Float) # => [1.0, 2.0, 3.0]
  # String.toy(3, String) # => ['tt', 'uuuu', 'cc']
  # String.toy(3, Time) # => [2014-02-22 08:49:49 -0800,
  #                           2014-02-23 08:49:49 -0800,
  #                           2014-02-24 08:49:49 -0800]
  # String.toy(3, Date) # => [#<Date: 2014-02-22 ((2456711j,0s,0n),+0s,2299161j)>,
  #                           #<Date: 2014-02-23 ((2456712j,0s,0n),+0s,2299161j)>,
  #                           #<Date: 2014-02-24 ((2456713j,0s,0n),+0s,2299161j)>]
  # 
  # == Size & an unknown object (that responds to new)
  #
  # String.toy(3, Object) # => [#<Object:0x007fa36e9b9128>,
  #                             #<Object:0x007fa36e9b9100>,
  #                             #<Object:0x007fa36e9b90d8>]


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
 

 