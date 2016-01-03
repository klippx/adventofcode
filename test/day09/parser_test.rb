require 'minitest/autorun'
require './day09/day09'

describe Day09::Parser do
  describe '#shortest_distance' do
    it 'The shortest of these is London -> Dublin -> Belfast = 605' do
      Day09::Parser.new(File.open('./test/day09/fixtures/parser_input.txt').read).shortest_distance.must_equal 605
    end
  end
end
