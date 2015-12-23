require 'minitest/autorun'
require './day03/day03'

describe Day03::Parser do
  describe '#total_houses' do
    it '> delivers to two houses' do
      subject = Day03::Parser.new('>')
      subject.total_houses.must_equal 2
    end

    it '^>v< delivers to four houses' do
      subject = Day03::Parser.new('^>v<')
      subject.total_houses.must_equal 4
    end

    it '^v^v^v^v^v delivers to two houses' do
      subject = Day03::Parser.new('^v^v^v^v^v')
      subject.total_houses.must_equal 2
    end
  end
end
