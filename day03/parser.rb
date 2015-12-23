module Day03
  class Parser
    def initialize(input)
      @input = input
      @position = [0,0]
      @houses_deliveries = {}
    end

    def to_s
      "Total houses delivered to: #{total_houses}\n"
    end

    def total_houses
      @houses_deliveries['0x0y'] = 1
      @input.split(//).each do |move|
        delivery_service = DeliveryService.new(current_position: @position, move: move)
        @position = delivery_service.move

        coord = delivery_service.coordinate_string
        if @houses_deliveries.key?(coord)
          @houses_deliveries[coord] += 1
        else
          @houses_deliveries[coord] = 1
        end
      end

      @houses_deliveries.keys.size
    end
  end
end
