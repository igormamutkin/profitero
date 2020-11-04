require_relative 'station'
require_relative 'instanceCounter'

class Route
  attr_reader :all_station, :name

  include InstanceCounter

  def initialize(name, first_station, last_station)
    @name = name
    @all_station = [first_station, last_station]
    register_instance(self.class)
  end

  def add_station(station)
    @all_station.insert(@all_station.length - 1, station)
  end

  def remove_station(station)
    @all_station.delete(station)
  end

  def list_stations
    @all_station.each(&:station_info)
  end

  def show_module
    puts InstanceCounter.instances(self.class)
  end
end
