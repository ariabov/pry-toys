require "pry-toys"
require "rspec"

RSpec.configure do |config|
  # Use color in STDOUT
  config.color_enabled = true if config.respond_to? :color_enabled

  # Use color not only in STDOUT but also in pagers and files
  config.tty = true
end
