module Day07
  class CircuitBoard
    def initialize(gates, wires)
      @gates=gates
      @wires=wires
    end

    def resolve
      @resolved_wires={}
      until @resolved_wires.keys.size == @wires.size do
        @wires.each do |wire|
          begin
            @resolved_wires[wire.name] = get_wire_output(wire) unless @resolved_wires.key? wire.name
          rescue CircuitError
          end
        end
      end

      @resolved_wires.keys.sort.map do |wire_name|
        "#{wire_name} -> #{@resolved_wires[wire_name]}"
      end
    end

    def tap_wire_source(input_name)
      input = if input_name
        if input_name[/\d+/]
          input_name.to_i
        elsif @resolved_wires.key? input_name
          @resolved_wires[input_name]
        end
      end
    end

    def get_wire_output(wire)
      operator = wire.source.instance_variable_get(:@operator)
      if operator
        input_one_name = wire.source.instance_variable_get(:@input_one)
        input_two_name = wire.source.instance_variable_get(:@input_two)
        input_one = tap_wire_source(input_one_name)
        input_two = tap_wire_source(input_two_name)
        Gate.new(input_one, operator, input_two).output or fail CircuitError
      else
        wire.source.output
      end
    end
  end
end
