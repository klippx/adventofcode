require 'minitest/autorun'
require './day08/day08'

describe Day08::Parser do
  describe '#calculate_excess_weight' do
    it 'the total number of characters of string code (2 + 5 + 10 + 6 = 23) minus the total number of characters in memory for string values (0 + 3 + 7 + 1 = 11) is 23 - 11 = 12' do
      Day08::Parser.new('""\n"abc"\n"aaa\"aaa"\n"\x27"').calculate_excess_weight.must_equal 12
    end
  end
end

describe Day08::StringInspector do
  describe '#code_length' do
    it '"" is 2 characters of code (the two double quotes), but the string contains zero characters.' do
      Day08::StringInspector.new('""').code_length.must_equal 2
    end

    it '"abc" is 5 characters of code, but 3 characters in the string data' do
      Day08::StringInspector.new('"abc"').code_length.must_equal 5
    end

    it '"aaa\"aaa" is 10 characters of code, but the string itself contains six "a" characters and a single, escaped quote character, for a total of 7 characters in the string data' do
      Day08::StringInspector.new('"aaa\"aaa"').code_length.must_equal 10
    end

    it '"\x27" is 6 characters of code, but the string itself contains just one - an apostrophe (\'), escaped using hexadecimal notation' do
      Day08::StringInspector.new('"\x27"').code_length.must_equal 6
    end
  end

  describe '#char_length' do
    it '"" is 2 characters of code (the two double quotes), but the string contains zero characters.' do
      Day08::StringInspector.new('""').char_length.must_equal 0
    end

    it '"abc" is 5 characters of code, but 3 characters in the string data' do
      Day08::StringInspector.new('"abc"').char_length.must_equal 3
    end

    it '"aaa\"aaa" is 10 characters of code, but the string itself contains six "a" characters and a single, escaped quote character, for a total of 7 characters in the string data' do
      Day08::StringInspector.new('"aaa\"aaa"').char_length.must_equal 7
    end

    it '"\x27" is 6 characters of code, but the string itself contains just one - an apostrophe (\'), escaped using hexadecimal notation' do
      Day08::StringInspector.new('"\x27"').char_length.must_equal 1
    end
  end
end
