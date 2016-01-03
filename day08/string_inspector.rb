module Day08
  class StringInspector
    def initialize(input)
      @input=input
    end

    def code_length
      @input.length
    end

    def char_length
      @input
        .gsub(/\\x[0-9a-fA-F][0-9a-fA-F]/,'#')
        .gsub(/\\"/,'@')
        .gsub(/\"/,'')
        .gsub(/\\\\/,'x')
        .gsub(/\\/,'')
        .length
    end

    def encoded_length
      "\"#{encoded_length_inner}\"".length
    end

    private

    def encoded_length_inner
      @input
        .gsub(/"/,'^^')
        .gsub(/\\/,'vv')
        .gsub(/\\x/,'>>>')
        .gsub(/\\\\/,'<<')
      end
  end
end
