require 'pry'

module Day07
  class CircuitError < RuntimeError; end;
  class Parser
    def initialize(input)
      @input=input
    end

    def to_s
      solution_part1 = build_circuit.resolve.select { |a| a.start_with?('a ->') }.first
      override_text = "#{solution_part1.split(' -> ')[1]} -> b"
      solution_part2 = build_circuit_with_override(override_text).resolve.select { |a| a.start_with?('a ->') }.first
      "Result, part1: #{solution_part1}\nResult, part2: #{solution_part2}\n"
    end

    def build_circuit
      gates=[]
      wires=[]
      @input.split("\n").each do |instruction|
        gate_text, wire_text = instruction.split(' -> ')
        gate = assemble_gate(gate_text)
        gates << gate
        wires << Wire.new(wire_text, gate)
      end

      CircuitBoard.new(gates, wires)
    end

    def build_circuit_with_override(override_text)
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

      CircuitBoard.new(gates, wires)
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
