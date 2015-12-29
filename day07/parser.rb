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
end
