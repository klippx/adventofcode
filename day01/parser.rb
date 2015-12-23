module Day01
  class Parser
    def initialize(input)
      @input = input
      @entered_basement_at = nil
    end

    def to_s
      "The final floor is: #{follow_instructions}\nThe basement is first entered at: #{@entered_basement_at}"
    end

    def find_basement
      if @entered_basement_at.nil?
        follow_instructions
      end

      if @entered_basement_at.nil?
        'Never'
      else
        @entered_basement_at
      end
    end

    def follow_instructions
      @input.split(//).each_with_index.inject(0) do |floor, instruction_index|
        instruction = instruction_index[0]
        index = instruction_index[1]
        if instruction == '('
          floor += 1
        elsif instruction == ')'
          floor -= 1
        end

        if floor < 0 && @entered_basement_at.nil?
          @entered_basement_at = index + 1
        end

        floor
      end
    end
  end
end
