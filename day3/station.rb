require_relative 'train.rb'

class Station

  attr_reader :name

  def initialize(name)
	@name = name
	@trains = []
  end

  def add_train(train)
  	@trains << train
  end

  def show_trains
  	@trains.each {|flag| puts "На станции #{@name} находится поезд - #{flag.number} "}
  	puts "На станции #{name} нет поездов" if @trains.empty?
  end

  def get_trains_by_type(type)
  	result = @trains.select {|flag| flag.type.downcase.eql?(type.downcase)}
  	result.each {|flag| flag.train_info}
  end

  def send_train(train)
    @trains.delete(train)
  end

  def station_info
  	puts "Станция - #{@name}"
  end

end