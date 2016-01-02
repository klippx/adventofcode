module Day08
  class Parser
    def initialize(input)
      @input=input
    end

    def to_s
      "Result, part1: #{calculate_excess_weight}\n"
    end

    def calculate_excess_weight
      total_char_length = 0
      total_code_length = 0
      @input.split("/n").each do |string|
        inspector = StringInspector.new(string)
        total_char_length = total_char_length + inspector.char_length
        total_code_length = total_code_length + inspector.code_length
      end

      total_code_length - total_char_length
    end
  end
end
