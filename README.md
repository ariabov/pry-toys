# Pry-Toys

For the times when you need to create a throwaway __Array__ of Floats:

```ruby
Array.toy(3, Float) # => [1.0, 2.0, 3.0]
```

or __Hash__ with 300 keys:    

```ruby    
Hash.toy(300) # => { a: 1, b: 2, ..., kn: 300 }
```

or __String__ with 2 words:

```ruby
String.toy(2) # => "ttttttt oooo"
```

After gem is installed, these toy / throwaway Ruby objects are loaded in automatically when __pry__ is started. The idea was inspired by [this](https://gist.github.com/lucapette/807492)

## Installation

You can either install gem individually or you can add it to your Gemfile. To add the gem directly, type in the following in your terminal line:

```ruby
gem install pry-toys
```

Alternatively, if your project has a `Gemfile`, you can add __pry-toys__ there:

```ruby
gem 'pry-toys'
```

Or if you would like to add the gem to specific group, you can do the following:

```ruby
group :development, :test do
  gem 'pry-toys'
end
```

This will ensure that the gem is only loaded in `development` or `test` environments, but not in `production`. Do not forget to run

```ruby
bundle install
```

after adding the __pry-toys__ to Gemfile.

To make sure __pry-toys__ has been successfully added to __pry__, run the following in your terminal:

```ruby
pry --installed-plugins
```

If __pry-toys__ gem installed correctly, you should see `toys` as one of the plugins in the list.

## Usage

Here are some of the things you can do with __pry-toys__:

#### Arrays

With only size set

```ruby
Array.toy(3) # => [1, 2, 3]
```

With size & block

```ruby  
Array.toy(3) {|i| i + 3} # => [3, 6, 9]
```
  
With size & one of the pre-determined objects, such as Integer (default), Float, String, Time, Date set
  
```ruby
Array.toy(3, Float) # => [1.0, 2.0, 3.0]
Array.toy(3, String) # => ['tt', 'uuuu', 'cc']
Array.toy(3, Time) # => [2014-02-22 08:49:49 -0800, 2014-02-23 08:49:49 -0800, 2014-02-24 08:49:49 -0800]
Array.toy(3, Date) # => [#<Date: 2014-02-22 ((2456711j,0s,0n),+0s,2299161j)>,
                         #<Date: 2014-02-23 ((2456712j,0s,0n),+0s,2299161j)>,
                         #<Date: 2014-02-24 ((2456713j,0s,0n),+0s,2299161j)>]
```                        

With size & an unknown object (that responds to new)

```ruby
Array.toy(3, Object) # => [#<Object:0x007fa36e9b9128>,
                           #<Object:0x007fa36e9b9100>,
                           #<Object:0x007fa36e9b90d8>]
```

#### Enumerators

Enumerators are always infinite. You can set the type the same way like in Array:

```ruby
Enumerator.toy(Time) # => #<Enumerator: ...>
Enumerator.toy(Time).take(3)  # => [#<Date: 2014-02-22 ((2456711j,0s,0n),+0s,2299161j)>,
                                    #<Date: 2014-02-23 ((2456712j,0s,0n),+0s,2299161j)>,
                                    #<Date: 2014-02-24 ((2456713j,0s,0n),+0s,2299161j)>]
```

When passing a block, it will be executed lazily:
```
> enum = Enumerator.toy {|i| puts "Called with #{i}" }
> enum.next
Called with 0
> enum.next
Called with 1
```

#### Hashes

With size set, you can make Hash as small or as big as you want:

```ruby
Hash.toy(3) # => {a: 1, b: 2, c: 3}
```

Or as large as 100000 (or larger)
 
```ruby   
h = Hash.toy(100000)
h.keys.last # => "eqxd"
h.values.last # => 100000
h # => {a: 1, ...., eqxd: 100000}
```

#### Strings

Creates a string with certain number of words. In this case, words are random collection of letters (not actual words).

```ruby
String.toy(3) # => "mmmmmmmm xxxx hhhhhh"
```

## Contributing

1) Form the project

2) Make changes

3) Test changes using the following task:
  
    rake spec

4) Commit changes. Please do not change `pry-toys.gemspec` on the version you are planning to submit for the pull request.

5) Send a pull request
