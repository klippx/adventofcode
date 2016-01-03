require 'minitest/autorun'
require './day09/day09'

describe Day09::Parser do
  describe '#shortest_distance' do
    it 'The shortest of these is London -> Dublin -> Belfast = 605' do
      subject = Day09::Parser.new(File.open('./test/day09/fixtures/parser_input.txt').read)
      subject.process
      subject.shortest_distance.must_equal 605
    end
  end

  describe '#longest_distance' do
    it 'the longest route would be 982 via (for example) Dublin -> London -> Belfast.' do
      subject = Day09::Parser.new(File.open('./test/day09/fixtures/parser_input.txt').read)
      subject.process
      subject.longest_distance.must_equal 982
    end
  end
end
