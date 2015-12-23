require 'minitest/autorun'
require './day01/day01'

describe Day01::Parser do
  it '(()) result in floor 0' do
    subject = Day01::Parser.new('(())')
    subject.follow_instructions.must_equal 0
  end

  it '()() result in floor 0' do
    subject = Day01::Parser.new('()()')
    subject.follow_instructions.must_equal 0
  end

  it '((( result in floor 3' do
    subject = Day01::Parser.new('(((')
    subject.follow_instructions.must_equal 3
  end

  it '(()(()( result in floor 3' do
    subject = Day01::Parser.new('(()(()(')
    subject.follow_instructions.must_equal 3
  end

  it '))((((( result in floor 3' do
    subject = Day01::Parser.new('))(((((')
    subject.follow_instructions.must_equal 3
  end

  it '()) result in floor -1' do
    subject = Day01::Parser.new('())')
    subject.follow_instructions.must_equal -1
  end

  it '))( result in floor -1' do
    subject = Day01::Parser.new('))(')
    subject.follow_instructions.must_equal -1
  end


  it '))) result in floor -3' do
    subject = Day01::Parser.new(')))')
    subject.follow_instructions.must_equal -3
  end

  it ')())()) result in floor -1' do
    subject = Day01::Parser.new(')())())')
    subject.follow_instructions.must_equal -3
  end
end
