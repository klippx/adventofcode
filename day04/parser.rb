require 'digest'
require 'benchmark'

module Day04
  class Parser
    def initialize(input)
      @input=input.strip
    end

    def to_s
      puts Benchmark.measure { puts "Result, part1: #{find_md5('00000')}\n" }
      puts Benchmark.measure { puts "Result, part2: #{find_md5('000000')}\n" }
    end

    def find_md5(prefix)
      @i = 0
      until md5(@i).start_with?(prefix) do
        @i += 1
      end
      @i
    end

    private

    def md5(i)
      Digest::MD5.hexdigest("#{@input}#{i}")
    end
  end
end
