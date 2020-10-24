require_relative 'station.rb'
require_relative 'route.rb'

class Train

  def initialize(number, type, number_car)
  	@number = number
  	@type = type
  	@number_car = number_car  
  	@speed = 0
  	@index_station
  end

  attr_accessor :number, :type, :number_car, :speed, :current_station

  def pick_up_speed(value)
  	@speed+=value
  end

  def slow_down(value)
  	if value <= @speed
  	  @speed -= value 
    else 
      puts "скорость не может быть меньше нуля"
    end
  end

  def get_speed
  	puts "Скорость поезда #{number} - #{@speed}"
  end

  def add_car
  	@number_car+=1 if @speed == 0
  end

  def remove_car
  	@number_car-=1 if @speed== 0 && @number_car > 1
  end

  def get_car
  	puts "Количество вагонов - #{@number_car}"
  end

  def add_route(route)
  	@index_station = 0
    @current_station = route.all_station[@index_station]
  end	

  def run_ahead(route)
  	@index_station += 1
  	@current_station = route.all_station[@index_station] if @index_station < route.all_station.length
  end

  def run_back(route)
  	@index_station -= 1
  	@current_station = route.all_station[@index_station] if @index_station >= 0
  end

  def station_info(route)
  	puts "Текущая станция - #{route.all_station[@index_station].name}"
  	puts "Предыдущая станция - #{route.all_station[@index_station - 1].name}" if @index_station > 0
  	puts "Следующая станция - #{route.all_station[@index_station + 1].name}" if @index_station < route.all_station.length
  end

end