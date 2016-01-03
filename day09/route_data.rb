module Day09
  class RouteData
    def initialize(input)
      @input=input
    end

    def self.parse(input)
      new(input).parse
    end

    # Tristram to AlphaCentauri = 34
    def parse
      [
        @input[/\A\w+/],
        @input[/to \w+/][(3..-1)],
        @input[/\d+\z/].to_i,
      ]
    end
  end
end
