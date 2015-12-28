module Day07
  class Parser
    def initialize(input)
      @input=input
    end

    def to_s
      "Result: #{some_method}\n"
    end

    def some_method
    end
  end

  class Gate
    def initialize(input_one, operator, input_two=nil)
      @operator=operator.downcase.to_sym
      @input_one=input_one
      @input_two=input_two
    end

    def output
      self.send(@operator)
    end

    def and
      @input_one & @input_two
    end

    def or
      @input_one | @input_two
    end

    def rshift
      @input_one >> @input_two
    end

    def lshift
      @input_one << @input_two
    end

    def not
      @input_one
        .to_s(2)
        .rjust(16, '0')
        .split(//)
        .map { |d| d == '0' ? '1' : '0' }
        .join('')
        .to_i(2)
    end
  end

  # Gate:     source=Gate.new(...).output
  # Constant: source=123
  class Wire
    def initialize(name)
      @name=name
      @source=source
    end
  end
end
