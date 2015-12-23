task :default => :test
task :test do
  require './test/minitest_helper'
  Dir.glob('./test/**/*_test.rb').each { |file| require file }
end
