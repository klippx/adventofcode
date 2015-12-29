module Day07
  class Wire
    def initialize(name, source)
      @name=name
      @source=source
    end

    def name
      @name
    end

    def source
      @source
    end

    def tap_wire_source(input_name, resolved_wires)
      input = if input_name
        if input_name[/\d+/]
          input_name.to_i
        elsif resolved_wires.key? input_name
          resolved_wires[input_name]
        end
      end
    end

    def output(resolved_wires)
      operator = @source.instance_variable_get(:@operator)
      if operator
        input_one_name = @source.instance_variable_get(:@input_one)
        input_two_name = @source.instance_variable_get(:@input_two)
        input_one = tap_wire_source(input_one_name, resolved_wires)
        input_two = tap_wire_source(input_two_name, resolved_wires)
        Gate.new(input_one, operator, input_two).output or fail CircuitError
      else
        @source.output
      end
    end

  end
end
