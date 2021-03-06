module Day07
  class Gate
    def initialize(input_one, operator=nil, input_two=nil)
      @operator=operator.downcase.to_sym if operator
      @input_one=input_one
      @input_two=input_two
    end

    def operator
      @operator
    end

    def to_s
      "Gate<##{object_id}> [#{@input_one} #{@operator} #{@input_two}]"
    end

    def probe_wire(wire_name, resolved_wires)
      input_name = instance_variable_get("@input_#{wire_name}".to_sym)
      input = if input_name
        if input_name[/\d+/]
          input_name.to_i
        elsif resolved_wires.key? input_name
          resolved_wires[input_name]
        end
      end
    end

    def output
      if @operator
        self.send(@operator)
      elsif @input_one
        @input_one
      end
    end

    def and
      fail CircuitError, 'both inputs must be present' if @input_one.nil? || @input_two.nil?
      @input_one & @input_two
    end

    def or
      fail CircuitError, 'both inputs must be present' if @input_one.nil? || @input_two.nil?
      @input_one | @input_two
    end

    def rshift
      fail CircuitError, 'both inputs must be present' if @input_one.nil? || @input_two.nil?
      @input_one >> @input_two
    end

    def lshift
      fail CircuitError, 'both inputs must be present' if @input_one.nil? || @input_two.nil?
      @input_one << @input_two
    end

    def noop
      @input_one
    end

    def not
      fail CircuitError, 'input must be present' if @input_one.nil?
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
