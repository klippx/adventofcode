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
      if @source.operator
        Gate.new(
          @source.probe_wire(:one, resolved_wires),
          @source.operator,
          @source.probe_wire(:two, resolved_wires)
        ).output or fail CircuitError
      else
        @source.output
      end
    end

  end
end
