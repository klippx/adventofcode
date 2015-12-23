module Day01
  class Parser
    def initialize(input)
      @input = input
    end

    def to_s
      "The floor is: #{follow_instructions.to_s}"
    end

    def follow_instructions
      @input.split(//).inject(0) do |floor, instruction|
        if instruction == '('
          floor += 1
        elsif instruction == ')'
          floor -= 1
        else
          floor = floor
        end
      end
    end
  end
end
