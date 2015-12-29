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
            @resolved_wires[wire.name] = wire.output(@resolved_wires) unless @resolved_wires.key? wire.name
          rescue CircuitError
            # *swallow* - mmm... yummy!
          end
        end
      end

      @resolved_wires.keys.sort.map do |wire_name|
        "#{wire_name} -> #{@resolved_wires[wire_name]}"
      end
    end
  end
end
