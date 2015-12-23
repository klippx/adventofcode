module Day01
  class Parser
    def initialize(input)
      @input = input
    end

    def follow_instructions
      @input.split(//).inject(0) do |floor, instruction|
        if instruction == '('
          floor += 1
        elsif instruction == ')'
          floor -= 1
        end
      end
    end
  end
end
