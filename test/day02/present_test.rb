require 'minitest/autorun'
require './day02/day02'

describe Day02::Present do
  describe '#wrapping_needed' do
    it '2x3x4 requires 52 square feet of wrapping paper plus 6 square feet of slack' do
      subject = Day02::Present.new('2x3x4')
      subject.wrapping_needed.must_equal 58
    end

    it '1x1x10 requires 42 square feet of wrapping paper plus 1 square foot of slack' do
      subject = Day02::Present.new('1x1x10')
      subject.wrapping_needed.must_equal 43
    end
  end
end
