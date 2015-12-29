require 'pry'

module Day07
  class Parser
    def initialize(input)
      @input=input
    end

    def to_s
      "Result, part1: #{read_circuit.select { |a| a.start_with?('a ->') } }\n" +
      "Result, part2: #{override_circuit('3176 -> b').select { |a| a.start_with?('a ->') } }\n"
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

    def override_circuit(override_text)
      gates=[]
      wires=[]
      override_gate_text, override_wire_text = override_text.split(' -> ')
      gate = assemble_gate(override_gate_text)
      gates << gate
      wires << Wire.new(override_wire_text, gate)
      @input.split("\n").each do |instruction|
        gate_text, wire_text = instruction.split(' -> ')
        gate = assemble_gate(gate_text)
        gates << gate unless wire_text == override_wire_text
        wires << Wire.new(wire_text, gate) unless wire_text == override_wire_text
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
      if operator && operator != :noop
        input_one_name = wire.source.instance_variable_get(:@input_one)
        input_two_name = wire.source.instance_variable_get(:@input_two)
        input_one = tap_wire_source(input_one_name)
        input_two = tap_wire_source(input_two_name)
        output = Gate.new(input_one, operator, input_two).output
        flunk "[CircuitBoard#get_wire_output] gate is dependent on unresolved inputs #{input_one_name} => #{input_one}, #{input_two_name} => #{input_two}" unless output
        output
      elsif operator && operator == :noop
        input_one = @resolved_wires[wire.source.output]
        flunk "[CircuitBoard#get_wire_output] #{wire.name} is dependent on unresolved wire #{wire.source.to_s}" unless input_one
        input_one
      else
        wire.source.output
      end
    end

    def flunk(s)
      #puts s
      fail RuntimeError, s
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
