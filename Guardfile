# More info at https://github.com/guard/guard#readme

guard :rspec do
  watch(%r{lib/pry-toys/(.+).rb})  { |m| "spec/lib/pry-toys/#{m[1]}_spec.rb" }
  watch(%r{spec/lib/pry-toys/(.+)_spec.rb})  { |m| "spec/lib/pry-toys/#{m[1]}_spec.rb" }
end