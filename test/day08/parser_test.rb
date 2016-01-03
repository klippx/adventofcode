require 'minitest/autorun'
require './day08/day08'

describe Day08::Parser do
  describe '#total_code_length' do
    it 'the total number of characters of string code (2 + 5 + 10 + 6 + 45 + 16 + 7 = 91)' do
      Day08::Parser.new(File.open('./test/day08/fixtures/parser_input.txt').read).total_code_length.must_equal 91
    end
  end

  describe '#total_char_length' do
    it 'the total number of characters in memory for string values (0 + 3 + 7 + 1 + 30 + 12 + 4 = 57)' do
      Day08::Parser.new(File.open('./test/day08/fixtures/parser_input.txt').read).total_char_length.must_equal 57
    end
  end

  describe '#total_encoded_length' do
    it 'the total number of characters of string code for encoded values (6 + 9 + 16 + 11 + 56 + 24 + 13 = 139)' do
      Day08::Parser.new(File.open('./test/day08/fixtures/parser_input.txt').read).total_encoded_length.must_equal 139
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

    it '"\\\\mouqqcsgmz" => 16' do
      Day08::StringInspector.new('"\\\\\\\\mouqqcsgmz"').code_length.must_equal 16
    end

    it '"hey\\" => 7' do
      Day08::StringInspector.new('"hey\\\\"').code_length.must_equal 7
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

    it '"\\\\mouqqcsgmz" => 12' do
      Day08::StringInspector.new('"\\\\\\\\mouqqcsgmz"').char_length.must_equal 12
    end

    it '"hey\\" => 4' do
      Day08::StringInspector.new('"hey\\\\"').char_length.must_equal 4
    end
  end

  describe '#encoded_length' do
    it '"" encodes to "\"\"", an increase from 2 characters to 6' do
      Day08::StringInspector.new('""').encoded_length.must_equal 6
    end

    it '"abc" encodes to "\"abc\"", an increase from 5 characters to 9' do
      Day08::StringInspector.new('"abc"').encoded_length.must_equal 9
    end

    it '"aaa\"aaa" encodes to "\"aaa\\\"aaa\"", an increase from 10 characters to 16' do
      Day08::StringInspector.new('"aaa\"aaa"').encoded_length.must_equal 16
    end

    it '"\x27" encodes to "\"\\x27\"", an increase from 6 characters to 11' do
      Day08::StringInspector.new('"\x27"').encoded_length.must_equal 11
    end

    it '"byc\x9dyxuafof\\\xa6uf\\axfozomj\\olh\x6a" encodes to "\"bycvvx9dyxuafof\\x9dyxa6uf\\\\axfozomj\\\\olh\\x6a\"" => 56' do
      Day08::StringInspector.new('"byc\x9dyxuafof\\\\\xa6uf\\\\axfozomj\\\\olh\x6a"').encoded_length.must_equal 56
    end

    it '"\\\\mouqqcsgmz" encodes to "\"\\\\\\\\mouqqcsgmz\"" => 24' do
      Day08::StringInspector.new('"\\\\\\\\mouqqcsgmz"').encoded_length.must_equal 24
    end

    it '"hey\\" encodes to "\"hey\\\\\"" => 13' do
      Day08::StringInspector.new('"hey\\\\"').encoded_length.must_equal 13
    end
  end
end
