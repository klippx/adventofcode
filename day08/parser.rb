module Day08
  class Parser
    def initialize(input)
      @input=input
    end

    def to_s
      "Result, part1: #{total_code_length - total_char_length}\n" +
      "Result, part2: #{total_encoded_length - total_code_length}\n"
    end

    def total_char_length
      total_length(:char_length)
    end

    def total_code_length
      total_length(:code_length)
    end

    def total_encoded_length
      total_length(:encoded_length)
    end

    private

    def total_length(method)
      lengths = []
      @input.split("\n").each do |string|
        inspector = StringInspector.new(string)
        lengths << inspector.send(method)
      end
      lengths.inject(:+)
    end
  end
end
