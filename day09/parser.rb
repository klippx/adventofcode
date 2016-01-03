module Day09
  class Parser
    def initialize(input)
      @input=input
    end

    def to_s
      "Result: #{shortest_distance}\n"
    end

    def shortest_distance
      @input.split("\n").each do |route|
        origin_name, destination_name, distance = RouteData.parse(route)
        Route.create(origin_name, destination_name, distance)
      end

      calculate_all_distances.min
    end

    def calculate_all_distances
      Location.all.permutation.map do |route|
        calculate_distance(route)
      end
    end

    def calculate_distance(route)
      distance = 0
      previous_location = route.first

      route[1..-1].each do |location|
        distance = distance + location.destinations[previous_location.name]
        previous_location = location
      end

      distance
    end
  end
end
