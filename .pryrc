Pry.config.hooks.add_hook(:before_session, :load_toys) do
  require File.join(File.dirname(__FILE__), 'lib/pry-toys/toy.rb')
  require File.join(File.dirname(__FILE__), 'lib/pry-toys/array.rb')
  require File.join(File.dirname(__FILE__), 'lib/pry-toys/hash.rb')
  require File.join(File.dirname(__FILE__), 'lib/pry-toys/string.rb')
end

