require 'pry'

task :default => :test
task :test do
  require './test/minitest_helper'
  Dir.glob('./test/**/*_test.rb').each { |file| require file }
end

namespace :day01 do
  task :test do
    Dir.glob('./test/day01/*_test.rb').each { |file| require file }
  end

  task :answer do
    require './day01/day01'
    puts Day01::Parser.new(File.open('./day01/input.txt').read)
  end
end

namespace :day02 do
  task :test do
    Dir.glob('./test/day02/*_test.rb').each { |file| require file }
  end

  task :answer do
    require './day02/day02'
    puts Day02::Parser.new(File.open('./day02/input.txt').read)
  end
end
