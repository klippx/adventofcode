module Day02
  class Present
    def initialize(raw_dimensions)
      @length, @width, @height = raw_dimensions.split('x').map { |dim| dim.to_i }
    end

    def ribbon_needed
      smallest_perimeter + volume
    end

    def wrapping_needed
      box_area + padding
    end

    private

    def box_area
      2*area_side_x + 2*area_side_y + 2*area_side_z
    end

    def padding
      [area_side_x, area_side_y, area_side_z].min
    end

    def smallest_perimeter
      dimensions.min(2)
        .map { |dim| dim*2 }
        .inject(:+)
    end

    def dimensions
      [@length, @width, @height]
    end

    def volume
      @length*@width*@height
    end

    def area_side_x
      @length*@width
    end

    def area_side_y
      @width*@height
    end

    def area_side_z
      @height*@length
    end
  end
end
