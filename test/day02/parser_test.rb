require 'minitest/autorun'
require './day02/day02'

describe Day02::Parser do
  describe '#total_wrapping_needed' do
    it 'sums the wrapping needed for each box dimension given in instructions' do
      subject = Day02::Parser.new("2x3x4\n1x1x10")
      subject.total_wrapping_needed.must_equal 58+43
    end
  end

  describe '#total_ribbon_needed' do
    it 'sums the ribbon needed for each box dimension given in instructions' do
      subject = Day02::Parser.new("2x3x4\n1x1x10")
      subject.total_ribbon_needed.must_equal 34+14
    end
  end
end
