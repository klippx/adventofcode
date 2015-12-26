require 'benchmark'

module Day06
  class Parser
    def initialize(input)
      @input=input
    end

    def to_s
      "Result -- part1: #{lights_count}\n" +
      "Result -- part2: #{brigthness_count}\n"
    end

    def lights_count
      reset_grid
      bench = { turn_on: [], turn_off: [], toggle: [] }
      parsed_instruction, start_pos, end_pos = nil, nil, nil
      t1=Time.now
      @input.split("\n").each_with_index do |instruction, i|
        parsed_instruction, start_pos, end_pos = parse_instruction(instruction, :part_one)
        bench[parsed_instruction] << Benchmark.realtime { send(parsed_instruction, start_pos, end_pos) }
        report_progress(t1, i, bench) if i > 0 && i%50 == 0
      end

      count_grid
    end

    def brigthness_count
      reset_grid
      bench = { turn_on_2: [], turn_off_2: [], toggle_2: [] }
      parsed_instruction, start_pos, end_pos = nil, nil, nil
      t1=Time.now
      @input.split("\n").each_with_index do |instruction, i|
        parsed_instruction, start_pos, end_pos = parse_instruction(instruction, :part_two)
        bench[parsed_instruction] << Benchmark.realtime { send(parsed_instruction, start_pos, end_pos) }
        report_progress(t1, i, bench) if i > 0 && i%50 == 0
      end

      count_grid
    end

    private

    # --- PART ONE HELPERS ---

    def turn_on(start_pos, end_pos)
      (start_pos[:x]..end_pos[:x]).each do |x|
        (start_pos[:y]..end_pos[:y]).each do |y|
          @grid[x][y] = 1
        end
      end
    end

    def turn_off(start_pos, end_pos)
      (start_pos[:x]..end_pos[:x]).each do |x|
        (start_pos[:y]..end_pos[:y]).each do |y|
          @grid[x][y] = 0
        end
      end
    end

    def toggle(start_pos, end_pos)
      (start_pos[:x]..end_pos[:x]).each do |x|
        (start_pos[:y]..end_pos[:y]).each do |y|
          if @grid[x][y] == 0
            @grid[x][y] = 1
          else
            @grid[x][y] = 0
          end
        end
      end
    end

    # --- PART TWO HELPERS ---

    def turn_on_2(start_pos, end_pos)
      (start_pos[:x]..end_pos[:x]).each do |x|
        (start_pos[:y]..end_pos[:y]).each do |y|
          @grid[x][y] += 1
        end
      end
    end

    def turn_off_2(start_pos, end_pos)
      (start_pos[:x]..end_pos[:x]).each do |x|
        (start_pos[:y]..end_pos[:y]).each do |y|
          if @grid[x][y] > 0
            @grid[x][y] -= 1
          end
        end
      end
    end

    def toggle_2(start_pos, end_pos)
      (start_pos[:x]..end_pos[:x]).each do |x|
        (start_pos[:y]..end_pos[:y]).each do |y|
          @grid[x][y] += 2
        end
      end
    end

    # --- SHARED HELPERS ---

    def parse_instruction(instruction, part)
      method = instruction.start_with?('turn on') && :turn_on ||
               instruction.start_with?('turn off') && :turn_off ||
               instruction.start_with?('toggle') && :toggle or
               fail "Unknown instruction; #{instruction}"

      start_coord = instruction.match(/(\d+,\d+)/)[1] or
                    fail "Unknown start coordinates; #{instruction}"
      end_coord =   instruction.match(/\d+,\d+[^\d]+(\d+,\d+)/)[1] or
                    fail "Unknown end coordinates; #{instruction}"

       method = "#{method}_2".to_sym if part == :part_two

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

    def reset_grid
      @grid=[]
      (0..999).each do |x|
        @grid[x]=[]
        (0..999).each do |y|
          @grid[x][y]=0
        end
      end
    end

    def count_grid
      count=0
      (0..999).each do |x|
        (0..999).each do |y|
          count += @grid[x][y]
        end
      end
      count
    end

    def report_progress(t1, i, bench)
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
        puts "\t" + key.to_s.ljust(20) + sprintf("Time spent in method: %.2fs, relative: %.2f%%", total, total/elapsed_time*100)
      end
    end
  end
end
