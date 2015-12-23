module Day03
  class DeliveryService
    def initialize(current_position:, move: move)
      @current_position = current_position
      @move = move
    end

    def move
      case @move
      when '^'
        @current_position[1] += 1
      when 'v'
        @current_position[1] -= 1
      when '<'
        @current_position[0] -= 1
      when '>'
        @current_position[0] += 1
      end
    end

    def coordinate_string
      "#{@current_position[0]}x#{@current_position[1]}y"
    end
  end
end
