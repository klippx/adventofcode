module Day09
  class Location
    def initialize(name)
      @name=name
    end

    def self.clear
      @stored_locations=[]
    end

    def self.all
      @stored_locations
    end

    def self.find_by_name(name)
      @stored_locations.select { |location| location.name == name }.first
    end

    def self.save(location)
      @stored_locations = [] if @stored_locations.nil?
      return false if find_by_name(location.name)
      @stored_locations << location
    end

    def self.find_or_create(name)
      @stored_locations = [] if @stored_locations.nil?
      if location = find_by_name(name)
        location
      else
        location = new(name)
        location.save or raise "Failed to create location #{name}"
        location
      end
    end

    def add_destination(destination_name, distance)
      @destinations = {} if @destinations.nil?
      raise "Location #{name} already has #{destination_name} added" if @destinations.key?(destination_name)
      @destinations[destination_name] = distance
    end

    def save
      Location.save(self)
    end

    def destinations
      @destinations
    end

    def name
      @name
    end
  end
end
