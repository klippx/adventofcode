require 'minitest/autorun'
require './day04/day04'

describe Day04::Parser do
  describe '#find_md5' do
    it 'for input abcdef it returns 609043' do
      Day04::Parser.new('abcdef').find_md5.must_equal 609043
    end

    it 'for input pqrstuv it returns 1048970' do
      Day04::Parser.new('pqrstuv').find_md5.must_equal 1048970
    end
  end
end
