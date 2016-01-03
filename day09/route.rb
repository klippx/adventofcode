module Day09
  class Route
    def initialize(origin_name, destination_name, distance)
      @origin_name = origin_name
      @destination_name = destination_name
      @distance = distance
    end

    def self.create(origin_name, destination_name, distance)
      route = new(origin_name, destination_name, distance)
      route.create_locations
      route
    end

    def create_locations
      origin_location = Location.find_or_create(@origin_name)
      destination_location = Location.find_or_create(@destination_name)

      origin_location.add_destination(@destination_name, @distance)
      destination_location.add_destination(@origin_name, @distance)
    end

    def name
      @name
    end
  end
end
