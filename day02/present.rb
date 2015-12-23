module Day02
  class Present
    def initialize(raw_dimensions)
      @length, @width, @height = raw_dimensions.split('x').map { |dim| dim.to_i }
    end

    def wrapping_needed
      box_area + padding
    end

    def box_area
      2*side_x + 2*side_y + 2*side_z
    end

    def padding
      [side_x, side_y, side_z].min
    end

    private

    def side_x
      @length*@width
    end

    def side_y
      @width*@height
    end

    def side_z
      @height*@length
    end
  end
end
