module Day06
  class Parser
    def initialize(input)
      @input=input
      @grid={}
    end

    def to_s
      "Result -- part1: #{lights_count}\n"
    end

    def lights_count
      @input.split("\n").map do |instruction|
        parsed_instruction = parse_instruction(instruction)
      end
    end

    private

    def parse_instruction(instruction)
      method = instruction.start_with?('turn on') && :turn_on ||
               instruction.start_with?('turn off') && :turn_off ||
               instruction.start_with?('toggle') && :toggle or
               fail "Unknown instruction; #{instruction}"

      start_coord = instruction.match(/(\d+,\d+)/)[1] or
                    fail "Unknown start coordinates; #{instruction}"
      end_coord =   instruction.match(/\d+,\d+[^\d]+(\d+,\d+)/)[1] or
                    fail "Unknown end coordinates; #{instruction}"

      {
        method: method,
        start: {
          x: start_coord.match(/(\d+)/)[1].to_i,
          y: start_coord.match(/\d+,(\d+)/)[1].to_i,
        },
        end: {
          x: end_coord.match(/(\d+)/)[1].to_i,
          y: end_coord.match(/\d+,(\d+)/)[1].to_i,
        },
      }
    end
  end
end
