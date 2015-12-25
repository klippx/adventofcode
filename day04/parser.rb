require 'digest'
require 'benchmark'

module Day04
  class Parser
    def initialize(input)
      @input=input.strip
      @i=0
      @md5 = Digest::MD5.new
      @md5.hexdigest
      @md5.reset
    end

    def to_s
      result=''
      puts Benchmark.measure { result = "Result: #{find_md5}\n" }
      result
    end

    def find_md5
      until (md5(@i).slice(0,5) == '00000') do
        @md5.reset
        @i += 1
      end
      @i
    end

    private

    def md5(i)
      @md5.update("#{@input}#{i}").to_s
    end
  end
end
