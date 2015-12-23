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

  describe '#ribbon_needed' do
    it '2x3x4 requires 2+2+3+3 feet of ribbon to wrap the present plus 2*3*4 feet of ribbon for the bow, for a total of 34 feet' do
      subject = Day02::Present.new('2x3x4')
      subject.ribbon_needed.must_equal 34
    end

    it '1x1x10 requires 1+1+1+1 feet of ribbon to wrap the present plus 1*1*10 feet of ribbon for the bow, for a total of 14 feet.' do
      subject = Day02::Present.new('1x1x10')
      subject.ribbon_needed.must_equal 14
    end

    it 'can handle 20x20x20' do
      subject = Day02::Present.new('20x20x20')
      subject.ribbon_needed.must_equal 20+20+20+20 + 20*20*20
    end
  end
end
