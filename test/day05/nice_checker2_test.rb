require 'minitest/autorun'
require './day05/day05'

describe Day05::NiceChecker2 do
  describe '#is_nice?' do
    it 'qjhvhtzxzqqjkmpb is nice' do
      subject = Day05::NiceChecker2.new('qjhvhtzxzqqjkmpb')
      subject.is_nice?.must_equal true
    end

    it 'xxyxx is nice' do
      subject = Day05::NiceChecker2.new('xxyxx')
      subject.is_nice?.must_equal true
    end

    it 'uurcxstgmygtbstg is naughty' do
      subject = Day05::NiceChecker2.new('uurcxstgmygtbstg')
      subject.is_nice?.must_equal false
    end

    it 'ieodomkazucvgmuy is naughty' do
      subject = Day05::NiceChecker2.new('ieodomkazucvgmuy')
      subject.is_nice?.must_equal false
    end
  end
end
