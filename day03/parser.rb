module Day03
  class Parser
    def initialize(input)
      @input = input
      @x_pos = 0
      @y_pos = 0
      @houses_deliveries = {}
    end

    def to_s
      "Total houses delivered to: #{total_houses}\n"
    end

    def total_houses
      @houses_deliveries['0x0y'] = 1
      @input.split(//).each do |move|
        delivery_service = DeliveryService.new(x_pos: @x_pos, y_pos: @y_pos, move: move)
        @x_pos, @y_pos = delivery_service.move_it

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
