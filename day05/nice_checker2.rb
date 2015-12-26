module Day05
  class NiceChecker2
    def initialize(string)
      @string=string
    end

    def is_nice?
       at_least_one_repeating_letter_with_one_letter_between? && has_recurring_substrings_of_size_two?|| false
    end

    # It contains a pair of any two letters that appears at least twice in the string without overlapping,
    # like xyxy (xy) or aabcdefgaa (aa), but not like aaa (aa, but it overlaps).
    def has_recurring_substrings_of_size_two?
      pairs = (
        @string.split(//).each_slice(2).map { |pair| pair } +
        @string[(1..-1)].split(//).each_slice(2).map { |pair| pair }
      ).select { |pair| pair.size > 1 }

      pairs != pairs.uniq
    end

    # It contains at least one letter which repeats with exactly one letter between them,
    # like xyx, abcdefeghi (efe), or even aaa.
    def at_least_one_repeating_letter_with_one_letter_between?
      @string =~ /(\w)\w\1/ && true
    end
  end
end
