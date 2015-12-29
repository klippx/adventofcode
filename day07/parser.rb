require 'pry'

module Day07
  class Parser
    def initialize(input)
      @input=input
    end

    def to_s
      "Result: #{read_circuit}\n"
    end

    def read_circuit
      gates=[]
      wires=[]
      @input.split("\n").each do |instruction|
        gate_text, wire_text = instruction.split(' -> ')
        gate = assemble_gate(gate_text)
        gates << gate
        wires << Wire.new(wire_text, gate)
      end

      CircuitBoard.new(gates, wires).resolve
    end

    def assemble_gate(gate_text)
      splitted_gate_text = gate_text.split(' ')
      gate_params = if splitted_gate_text.size == 1
        if gate_text[/\d+/]
          Gate.new(gate_text.to_i)
        else
          Gate.new(gate_text, :noop)
        end
      elsif splitted_gate_text.size == 2
        Gate.new(*splitted_gate_text.reverse)
      else
        Gate.new(*splitted_gate_text)
      end
    end
  end

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
            unless @resolved_wires.key? wire.name
              @resolved_wires[wire.name] = get_wire_output(wire)
            end
          rescue StandardError
            @resolved_wires.delete wire.name
          end
        end
      end

      @resolved_wires.keys.sort.map do |wire_name|
        "#{wire_name} -> #{@resolved_wires[wire_name]}"
      end
    end

    def get_wire_output(wire)
      operator = wire.source.instance_variable_get(:@operator)
      if operator && operator != :noop
        input_one = @resolved_wires[wire.source.instance_variable_get(:@input_one)]
        input_two_name = wire.source.instance_variable_get(:@input_two)
        input_two = if input_two_name
          @resolved_wires[input_two_name] || input_two_name.to_i if input_two_name[/\d+/]
        end
        Gate.new(input_one, operator, input_two).output
      elsif operator && operator == :noop
        input_one = @resolved_wires[wire.source.output]
        input_one or raise RuntimeError, 'nope'
      else
        wire.source.output
      end
    end
  end

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
      else
        fail 'incomplete gate'
      end
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
  end
end
