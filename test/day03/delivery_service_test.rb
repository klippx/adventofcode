require 'minitest/autorun'
require './day03/day03'

describe Day03::DeliveryService do
  describe '#move' do
    it 'v result in translate coordinates down (by -1 in y)' do
      subject = Day03::DeliveryService.new(current_position: [3,5], move: 'v')
      subject.move
      subject.coordinate_string.must_equal '3x4y'
    end

    it '^ result in translate coordinates up (by 1 in y)' do
      subject = Day03::DeliveryService.new(current_position: [3,5], move: '^')
      subject.move
      subject.coordinate_string.must_equal '3x6y'
    end

    it '< result in translate coordinates left (by -1 in x)' do
      subject = Day03::DeliveryService.new(current_position: [0,0], move: '<')
      subject.move
      subject.coordinate_string.must_equal '-1x0y'
    end

    it '> result in translate coordinates right (by 0 in x)' do
      subject = Day03::DeliveryService.new(current_position: [-1,-1], move: '>')
      subject.move
      subject.coordinate_string.must_equal '0x-1y'
    end
  end

  describe '#coordinate_string' do
    it 'returns 3x5y for coord [3,5]' do
      subject = Day03::DeliveryService.new(current_position: [3,5])
      subject.coordinate_string.must_equal '3x5y'
    end

    it 'returns -10x-15y for coord [-10,-15]' do
      subject = Day03::DeliveryService.new(current_position: [-10,-15])
      subject.coordinate_string.must_equal '-10x-15y'
    end
  end
end
