require_relative 'station.rb'
require_relative 'route.rb'

class Train

	index_station = 0

  def initialize(number, type, number_car)
  	@number = number
    if type.downcase.eql?("грузовой") || type.downcase.eql?("пассажирский")
      @type = type
      else
      puts "Неправильный тип поезда" 
    end
  	@number_car = number_car  
  	@speed = 0
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

  def add_carriage
  	@number_car+=1 if @speed == 0
  end

  def remove_carriage
  	@number_car-=1 if @speed== 0 && @number_car > 1
  end

  def get_carriage
  	puts "Количество вагонов - #{@number_car}"
  end

  def add_route(route)
  	@index_station = 0
    @current_station = route.all_station[@index_station]
  end	

  def go_next(route)
  	route.all_station[@index_station].send_train(self)
  	@index_station += 1
  	@current_station = route.all_station[@index_station].add_train(self) if @index_station < route.all_station.length
  end

  def go_back(route)
  	route.all_station[@index_station].send_train(self)
  	@index_station -= 1
  	@current_station = route.all_station[@index_station].add_train(self) if @index_station >= 0
  end

  def station_info(route)
  	puts "Текущая станция - #{route.all_station[@index_station].name}"
  	puts "Предыдущая станция - #{route.all_station[@index_station - 1].name}" if @index_station > 0
  	puts "Следующая станция - #{route.all_station[@index_station + 1].name}" if @index_station < route.all_station.length
  end

end