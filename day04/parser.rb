require 'digest'

module Day04
  class Parser
    def initialize(input)
      @input=input.strip
    end

    def to_s
      "Result: #{find_md5}\n"
    end

    def find_md5
      i=0
      until (md5(i).slice(0,5) == '00000') do
        i += 1
      end
      i
    end

    private

    def md5(i)
      Digest::MD5.hexdigest "#{@input}#{i}"
    end
  end
end
