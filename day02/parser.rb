module Day02
  class Parser
    def initialize(input)
      @input = input
    end

    def to_s
      "Total wrapping neeeded: #{total_wrapping_needed}"
    end

    def total_wrapping_needed
      @input.split(/\n/).inject(0) do |sum, input|
        sum += Present.new(input).wrapping_needed
      end
    end
  end
end
