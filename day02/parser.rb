module Day02
  class Parser
    def initialize(input)
      @input = input
      @total_wrapping_needed = nil
      @total_ribbon_needed = nil
      @parsed = false
    end

    def to_s
      "Total wrapping neeeded: #{total_wrapping_needed}\n" +
      "Total ribbon neeeded: #{total_ribbon_needed}"
    end

    def total_wrapping_needed
      parsed? || parse_data
      @total_wrapping_needed
    end

    def total_ribbon_needed
      parsed? || parse_data
      @total_ribbon_needed
    end

    def parsed?
      @parsed == true
    end

    def parse_data
      @total_wrapping_needed = 0
      @total_ribbon_needed = 0
      @input.split(/\n/).each do |input|
        present = Present.new(input)
        @total_wrapping_needed += present.wrapping_needed
        @total_ribbon_needed += present.ribbon_needed
      end
      @parsed = true
    end
  end
end
