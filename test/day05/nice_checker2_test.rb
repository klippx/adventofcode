require 'minitest/autorun'
require './day05/day05'

describe Day05::NiceChecker2 do
  describe '#at_least_one_repeating_letter_with_one_letter_between?' do
    it 'xyx is true' do
      subject = Day05::NiceChecker2.new('xyx')
      subject.at_least_one_repeating_letter_with_one_letter_between?.must_equal true
    end

    it 'abcdefeghi is true' do
      subject = Day05::NiceChecker2.new('abcdefeghi')
      subject.at_least_one_repeating_letter_with_one_letter_between?.must_equal true
    end

    it 'aaa is true' do
      subject = Day05::NiceChecker2.new('aaa')
      subject.at_least_one_repeating_letter_with_one_letter_between?.must_equal true
    end
  end

  describe '#has_recurring_substrings_of_size_two?' do
    it 'xyxy is true' do
      subject = Day05::NiceChecker2.new('xyxy')
      subject.has_recurring_substrings_of_size_two?.must_equal true
    end

    it 'aabcdefgaa is true' do
      subject = Day05::NiceChecker2.new('aabcdefgaa')
      subject.has_recurring_substrings_of_size_two?.must_equal true
    end

    it 'aaa is false' do
      subject = Day05::NiceChecker2.new('aaa')
      subject.has_recurring_substrings_of_size_two?.must_equal false
    end
  end

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
