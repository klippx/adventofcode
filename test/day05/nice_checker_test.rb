require 'minitest/autorun'
require './day05/day05'

describe Day05::NiceChecker do
  describe '#is_nice?' do
    it 'ugknbfddgicrmopn is nice' do
      subject = Day05::NiceChecker.new('ugknbfddgicrmopn')
      subject.is_nice?.must_equal true
    end

    it 'aaa is nice' do
      subject = Day05::NiceChecker.new('aaa')
      subject.is_nice?.must_equal true
    end

    it 'jchzalrnumimnmhp is naughty' do
      subject = Day05::NiceChecker.new('jchzalrnumimnmhp')
      subject.is_nice?.must_equal false
    end

    it 'haegwjzuvuyypxyu is naughty' do
      subject = Day05::NiceChecker.new('haegwjzuvuyypxyu')
      subject.is_nice?.must_equal false
    end

    it 'dvszwmarrgswjxmb is naughty' do
      subject = Day05::NiceChecker.new('dvszwmarrgswjxmb')
      subject.is_nice?.must_equal false
    end
  end
end
