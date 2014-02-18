# Pry.config.hooks.add_hook(:before_session, :say_hi) do
  # Iterate through `pry-toys` directory and require each file
# end

require 'pry-toys/array'
require 'pry-toys/hash'
require 'pry-toys/string'
require 'pry-toys/toy'