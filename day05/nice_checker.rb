module Day05
  class NiceChecker
    def initialize(string)
      @string=string
    end

    def is_nice?
      !has_bad_substring? && at_least_one_letter_twice_in_a_row? && at_least_three_vowels? || false
    end

    private

    # Benchmark.realtime { strings.each { |string| at_least_three_vowels?(string) } }
    # => 0.0185
    def at_least_three_vowels?
      @string.split(//).select { |c| c[/a|e|i|o|u/] }.count >= 3
    end

    # Benchmark.realtime { strings.each { |string| at_least_one_letter_twice_in_a_row?(string) } }
    # => 0.0022
    def at_least_one_letter_twice_in_a_row?
      @string =~ /(\w)\1+/
    end

    # Benchmark.realtime { strings.each { |string| has_bad_substring?(string) } }
    # => 0.0010
    def has_bad_substring?
      @string.include?('ab') || @string.include?('cd') || @string.include?('pq') || @string.include?('xy')
    end
  end
end
