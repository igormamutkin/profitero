require_relative 'station.rb'

class Route
  
  def initialize(first_station, last_station)
  	@first_station = first_station
  	@last_station = last_station
  	@all_station = [@first_station, @last_station]
  end

  attr_accessor :first_station, :last_station, :all_station

  def add_station(station)
  	@all_station.insert(@all_station.length - 1, station)
  end
 
  def remove_station(station)
    @all_station.delete(station)
  end

  def list_station
  	puts @all_station.each {|flag| puts flag.name}
  end

end
