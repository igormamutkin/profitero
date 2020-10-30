require_relative 'station'

class Route
  attr_reader :all_station, :name

  def initialize(name, first_station, last_station)
    @name = name
    @all_station = [first_station, last_station]
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
end
