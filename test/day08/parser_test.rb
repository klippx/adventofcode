require 'minitest/autorun'
require './day08/day08'

describe Day08::Parser do
  describe '#total_code_length' do
    it 'the total number of characters of string code (2 + 5 + 10 + 6 + 43 = 66)' do
      Day08::Parser.new(File.open('./test/day08/fixtures/parser_input.txt').read).total_code_length.must_equal 66
    end
  end

  describe '#total_char_length' do
    it 'the total number of characters in memory for string values (0 + 3 + 7 + 1 + 29 = 40)' do
      Day08::Parser.new(File.open('./test/day08/fixtures/parser_input.txt').read).total_char_length.must_equal 40
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

    it '"qxfcsmh" => 9' do
      Day08::StringInspector.new('"qxfcsmh"').code_length.must_equal 9
    end

    it '"zf\x23\\hlj\\kkce\\d\\asy\"yyfestwcdxyfj" => 42' do
      Day08::StringInspector.new('"zf\x23\\\\hlj\\\\kkce\\\\d\\\\asy\"yyfestwcdxyfj"').code_length.must_equal 42
    end

    it '"byc\x9dyxuafof\\\xa6uf\\axfozomj\\olh\x6a" => 43' do
      Day08::StringInspector.new('"byc\x9dyxuafof\\\\\xa6uf\\\\axfozomj\\\\olh\x6a"').code_length.must_equal 43
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

    it '"qxfcsmh" => 7' do
      Day08::StringInspector.new('"qxfcsmh"').char_length.must_equal 7
    end

    it '"zf\x23\\hlj\\kkce\\d\\asy\"yyfestwcdxyfj" => 32' do
      Day08::StringInspector.new('"zf\x23\\\\hlj\\\\kkce\\\\d\\\\asy\"yyfestwcdxyfj"').char_length.must_equal 32
    end

    it '"byc\x9dyxuafof\\\xa6uf\\axfozomj\\olh\x6a" => 29' do
      Day08::StringInspector.new('"byc\x9dyxuafof\\\\\xa6uf\\\\axfozomj\\\\olh\x6a"').char_length.must_equal 29
    end
  end
end
