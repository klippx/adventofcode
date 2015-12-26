require 'benchmark'

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
      bench = { turn_on: [], turn_off: [], toggle: [], parse_instruction: [] }
      parsed_instruction, start_pos, end_pos = nil, nil, nil
      t1=Time.now
      @input.split("\n").each_with_index do |instruction, i|
        bench[:parse_instruction] << Benchmark.realtime { parsed_instruction, start_pos, end_pos = parse_instruction(instruction) }
        bench[parsed_instruction] << Benchmark.realtime { send(parsed_instruction, start_pos, end_pos) }
        if i > 0 && i%25 == 0
          t2=Time.now
          elapsed_time = t2-t1
          velocity = i/elapsed_time
          distance_left = 300-i
          printf "\nBenchmark report; Progress: %.2f%%, (elapsed time=%.2fs), (time left=%.2fs)\n", i/3.0, elapsed_time, distance_left/velocity
          bench.keys.each do |key|
            next unless bench[key].size > 0
            total = bench[key].inject(:+)
            count = bench[key].size
            avg = bench[key].inject(:+)
            puts key.to_s.ljust(20) + sprintf("Time spent in method: %.2fs, relative: %.2f%%", total, total/elapsed_time*100)
          end
        end
      end

      @grid.keys.count
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

      [
        method,
        {
          x: start_coord.match(/(\d+)/)[1].to_i,
          y: start_coord.match(/\d+,(\d+)/)[1].to_i,
        },
        {
          x: end_coord.match(/(\d+)/)[1].to_i,
          y: end_coord.match(/\d+,(\d+)/)[1].to_i,
        },
      ]
    end

    def turn_on(start_pos, end_pos)
      (start_pos[:x]..end_pos[:x]).each do |x|
        (start_pos[:y]..end_pos[:y]).each do |y|
          @grid[key(x,y)] = true
        end
      end
    end

    def turn_off(start_pos, end_pos)
      (start_pos[:x]..end_pos[:x]).each do |x|
        (start_pos[:y]..end_pos[:y]).each do |y|
          @grid.delete key(x,y)
        end
      end
    end

    def toggle(start_pos, end_pos)
      (start_pos[:x]..end_pos[:x]).each do |x|
        (start_pos[:y]..end_pos[:y]).each do |y|
          if @grid.key? key(x,y)
            @grid.delete key(x,y)
          else
            @grid[key(x,y)] = true
          end
        end
      end
    end

    def key(x,y)
      "#{x}x#{y}y"
    end
  end
end
