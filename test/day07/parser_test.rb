require 'minitest/autorun'
require 'minitest/focus'
require './day07/day07'

describe Day07::Parser do
  describe '#read_circuit' do
    it 'reads' do
      subject = Day07::Parser.new("NOT a -> b\n123 -> a")
      subject.read_circuit.must_equal ["a -> 123", "b -> 65412"]
    end

    it 'reads' do
      subject = Day07::Parser.new("NOT c -> b\n123 -> a\na LSHIFT 2 -> c")
      subject.read_circuit.must_equal ["a -> 123", "b -> 65043", "c -> 492"]
    end

    it 'reads' do
      subject = Day07::Parser.new("lx -> a\nlx -> b\n123 -> lx")
      subject.read_circuit.must_equal ["a -> 123", "b -> 123", "lx -> 123"]
    end

    it 'reads' do
      subject = Day07::Parser.new("123 -> lx\nlx -> ly\nly -> a")
      subject.read_circuit.must_equal ["a -> 123", "lx -> 123", "ly -> 123"]
    end

    it 'reads' do
      subject = Day07::Parser.new("123 -> lx\n456 -> ly\nly OR lx -> a")
      subject.read_circuit.must_equal ["a -> 507", "lx -> 123", "ly -> 456"]
    end

    it 'reads' do
      subject = Day07::Parser.new("c LSHIFT 1 -> t\n0 -> c")
      subject.read_circuit.must_equal ["c -> 0", "t -> 0"]
    end
  end
end

describe Day07::Gate do
  describe '#output' do
    it '123 AND 456 gives 72' do
      Day07::Gate.new(123, 'AND', 456).output.must_equal 72
    end

    it '123 OR 456 gives 507' do
      Day07::Gate.new(123, 'OR', 456).output.must_equal 507
    end

    it 'nil OR 456 gives ERROR' do
      assert_raises(RuntimeError) { Day07::Gate.new(nil, 'OR', 456).output }
    end

    it '123 LSHIFT 2 gives 492' do
      Day07::Gate.new(123, 'LSHIFT', 2).output.must_equal 492
    end

    it '456 RSHIFT 2 gives 114' do
      Day07::Gate.new(456, 'RSHIFT', 2).output.must_equal 114
    end

    it 'NOT 123 gives 65412' do
      Day07::Gate.new(123, 'NOT').output.must_equal 65412
    end

    it 'NOT 456 gives 65079' do
      Day07::Gate.new(456, 'NOT').output.must_equal 65079
    end

    it 'NOT 492 gives 65043' do
      Day07::Gate.new(492, 'NOT').output.must_equal 65043
    end
  end
end
