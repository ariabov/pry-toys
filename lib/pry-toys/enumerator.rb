require 'date'

##
# Reopening Enumerator class to add toy method
Enumerator.class_eval do

  ##
  # Creates an enumerator of objects based on the input
  # 
  # For example, it will work with the following inputs:
  #
  # == block
  #
  # String.toy {|i| i + 3}.take(3) # => [3, 6, 9]
  #
  # == one of the pre-determined objects, such as
  # Integer (default), Float, String, Time, Date
  #
  # Enumerator.toy(3, Float).take(3)
  #   # => [1.0, 2.0, 3.0]
  # Enumerator.toy(3, Enumerator)
  #   # => ['tt', 'uuuu', 'cc']
  # Enumerator.toy(3, Time)
  #   # => [2014-02-22 08:49:49 -0800,
  #         2014-02-23 08:49:49 -0800,
  #         2014-02-24 08:49:49 -0800]
  # Enumerator.toy(3, Date)
  #   # => [#<Date: 2014-02-22 ((2456711j,0s,0n),+0s,2299161j)>,
  #         #<Date: 2014-02-23 ((2456712j,0s,0n),+0s,2299161j)>,
  #         #<Date: 2014-02-24 ((2456713j,0s,0n),+0s,2299161j)>]
  # 
  # == an unknown object (that responds to new)
  #
  # Enumerator.toy(Object).take(3)
  #   # => [#<Object:0x007fa36e9b9128>,
  #         #<Object:0x007fa36e9b9100>,
  #         #<Object:0x007fa36e9b90d8>]


  def self.toy(type=Integer, &block)
    build_toy(type, 0) # ensure that toy can be built

    Enumerator.new do |yielder|
      i = 0

      loop do
        if block_given?
          yielder << block.call(i)
        else
          yielder << build_toy(type, i)
        end

        i = i.next
      end
    end
  end
  
  private
  def self.build_toy(type, i)
    case type.to_s
    when 'Integer'
      i+1
    when 'Float'
      i+1.0
    when 'String'
      String.toy(1)
    when 'Time'
      time_now = Time.now
      time_now + (i * (60 * 60 * 24))
    when 'Date'
      date_now = Date.today
      date_now + (i * 1)
    else
      raise NoNewMethodError, 'Please provide Object that responds to `new` call' unless type.respond_to? :new
      type.send(:new)
    end
  end
end
 

 
