module Day03
  class DeliveryService
    def initialize(x_pos:, y_pos:, move:)
      @x_pos = x_pos
      @y_pos = y_pos
      @move = move
    end

    def move_it
      case @move
      when '^'
        @y_pos += 1
      when 'v'
        @y_pos -= 1
      when '<'
        @x_pos -= 1
      when '>'
        @x_pos += 1
      end

      [@x_pos, @y_pos]
    end

    def coordinate_string
      "#{@x_pos}x#{@y_pos}y"
    end
  end
end
