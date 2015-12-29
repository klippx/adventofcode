module Day07
  class Gate
    def initialize(input_one, operator=nil, input_two=nil)
      @operator=operator.downcase.to_sym if operator
      @input_one=input_one
      @input_two=input_two
    end

    def to_s
      "Gate<##{object_id}> [#{@input_one} #{@operator} #{@input_two}]"
    end

    def output
      if @operator
        self.send(@operator)
      elsif @input_one
        @input_one
      end
    end

    def and
      fail RuntimeError, 'both inputs must be present' if @input_one.nil? || @input_two.nil?
      @input_one & @input_two
    end

    def or
      fail RuntimeError, 'both inputs must be present' if @input_one.nil? || @input_two.nil?
      @input_one | @input_two
    end

    def rshift
      fail RuntimeError, 'both inputs must be present' if @input_one.nil? || @input_two.nil?
      @input_one >> @input_two
    end

    def lshift
      fail RuntimeError, 'both inputs must be present' if @input_one.nil? || @input_two.nil?
      @input_one << @input_two
    end

    def noop
      @input_one
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
end
