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
        .gsub(/\\"/,'x')
        .gsub(/\"/,'')
        .gsub(/\\x[0-9a-fA-F][0-9a-fA-F]/,'x')
        .length
    end
  end
end
