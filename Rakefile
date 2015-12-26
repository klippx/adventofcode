require 'pry'

task :default => :test
task :test do
  require './test/minitest_helper'
  Dir.glob('./test/**/*_test.rb').each { |file| require file }
end

task :new do
  begin
    fail 'specify name using eg "DAY=4 rake new"' unless ENV['DAY']
    day_name = "day#{sprintf('%02d', ENV['DAY'])}"

    input_file_name = "./#{day_name}/input.txt"
    main_file_name = "./#{day_name}/#{day_name}.rb"
    parser_file_name = "./#{day_name}/parser.rb"
    parser_test_file_name = "test/#{day_name}/parser_test.rb"

    Dir.mkdir day_name
    Dir.mkdir 'test/' + day_name

    File.open(input_file_name, 'w') do |file|
      file.write "\n"
    end

    File.open(main_file_name, 'w') do |file|
      file.write "module #{day_name.capitalize}; end\n"
      file.write "require './#{day_name}/parser'\n"
    end

    File.open(parser_file_name, 'w') do |file|
      file.write "module #{day_name.capitalize}\n"
      file.write "  class Parser\n"
      file.write "    def initialize(input)\n"
      file.write "      @input=input\n"
      file.write "    end\n\n"
      file.write "    def to_s\n"
      file.write "      \"Result: \#\{some_method\}\\n\"\n"
      file.write "    end\n\n"
      file.write "    def some_method\n"
      file.write "    end\n"
      file.write "  end\n"
      file.write "end\n"
    end

    File.open(parser_test_file_name, 'w') do |file|
      file.write "require 'minitest/autorun'\n"
      file.write "require './#{day_name}/#{day_name}'\n\n"
      file.write "describe #{day_name.capitalize}::Parser do\n"
      file.write "  describe '#some_method' do\n"
      file.write "    it 'does something' do\n"
      file.write "    end\n"
      file.write "  end\n"
      file.write "end\n"
    end

    File.open('Rakefile', 'a') do |file|
      file.write <<-EOS

namespace :#{day_name} do
  task :test do
    Dir.glob('./test/#{day_name}/*_test.rb').each { |file| require file }
  end

  task :answer do
    require './#{day_name}/#{day_name}'
    puts #{day_name.capitalize}::Parser.new(File.open('./#{day_name}/input.txt').read)
  end
end
  EOS
    end
  rescue
    delete_if_exists input_file_name
    delete_if_exists main_file_name
    delete_if_exists parser_file_name
    delete_if_exists parser_test_file_name
    Dir.rmdir day_name
    Dir.rmdir 'test/' + day_name
    fail
  end
end

def delete_if_exists(file)
  File.delete file if File.exists? file
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

namespace :day03 do
  task :test do
    Dir.glob('./test/day03/*_test.rb').each { |file| require file }
  end

  task :answer do
    require './day03/day03'
    puts Day03::Parser.new(File.open('./day03/input.txt').read)
  end
end

namespace :day04 do
  task :test do
    Dir.glob('./test/day04/*_test.rb').each { |file| require file }
  end

  task :answer do
    require './day04/day04'
    puts Day04::Parser.new(File.open('./day04/input.txt').read)
  end
end

namespace :day05 do
  task :test do
    Dir.glob('./test/day05/*_test.rb').each { |file| require file }
  end

  task :answer do
    require './day05/day05'
    puts Day05::Parser.new(File.open('./day05/input.txt').read)
  end
end

namespace :day06 do
  task :test do
    Dir.glob('./test/day06/*_test.rb').each { |file| require file }
  end

  task :answer do
    require './day06/day06'
    puts Day06::Parser.new(File.open('./day06/input.txt').read)
  end
end
