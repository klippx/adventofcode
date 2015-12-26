module Day05
  class Parser
    def initialize(input)
      @input=input
    end

    def to_s
      "Part 1 -- Number of nice strings: #{select_nice.count}\n"
    end

    def select_nice
      @input.split("\n").select do |string|
        Day05::NiceChecker.new(string).is_nice?
      end
    end
  end
end
