module Day03
  class Parser
    def initialize(input)
      @input = input
      @x_pos = 0
      @y_pos = 0
      @robo_x_pos = 0
      @robo_y_pos = 0
      @houses_deliveries = {}
    end

    def to_s
      "Total houses delivered to: #{total_houses}\n"
    end

    def total_houses
      @houses_deliveries['0x0y'] = 1
      @input.split(//).each_with_index do |move, i|
        coord = if i % 2 == 0
          make_a_move(:santa, move)
        else
          make_a_move(:robo, move)
        end

        if @houses_deliveries.key?(coord)
          @houses_deliveries[coord] += 1
        else
          @houses_deliveries[coord] = 1
        end
      end

      @houses_deliveries.keys.size
    end

    private

    def make_a_move(piece, move)
      if piece == :santa
        delivery_service = DeliveryService.new(x_pos: @x_pos, y_pos: @y_pos, move: move)
        @x_pos, @y_pos = delivery_service.move_it
      else
        delivery_service = DeliveryService.new(x_pos: @robo_x_pos, y_pos: @robo_y_pos, move: move)
        @robo_x_pos, @robo_y_pos = delivery_service.move_it
      end
      delivery_service.coordinate_string
    end

  end
end
