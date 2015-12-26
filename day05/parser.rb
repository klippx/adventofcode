module Day05
  class Parser
    def initialize(input)
      @input=input
    end

    def to_s
      "Part 1 -- Number of nice strings: #{select_nice.count}\n" +
      "Part 2 -- Number of nice strings: #{select_nicer.count}\n"
    end

    def select_nice
      @input.split("\n").select do |string|
        Day05::NiceChecker.new(string).is_nice?
      end
    end

    def select_nicer
      @input.split("\n").select do |string|
        Day05::NiceChecker2.new(string).is_nice?
      end
    end
  end
end
