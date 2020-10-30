require_relative 'train'
require_relative 'station'
require_relative 'route'
require_relative 'passengerTrain'
require_relative 'cargoTrain'
require_relative 'cargoCarriage'
require_relative 'passengerCarriage'
require_relative 'logic'
require_relative 'information'

class Check
  def initialize(obj, logic)
    @obj = obj
    @logic = logic
  end

  def is_passengerTrain?
    if @obj.array_passengerTrains.length.positive?
      true
    else
      puts 'Добавьте хотя бы один пассажирский поезд'
      @logic.menu
    end
  end

  def is_cargoTrain?
    if @obj.array_cargoTrains.length.positive?
      true
    else
      puts 'Добавьте хотя бы один грузовой поезд'
      @logic.menu
    end
  end

  def is_train?
    if @obj.array_cargoTrains.length.positive? || @obj.array_passengerTrains.length.positive?
      true
    else
      puts 'Добавьте хотя бы один поезд'
      @logic.menu
    end
  end

  def is_passengerTrain_have_route?(index)
    if !@obj.array_passengerTrains[index].route.nil?
      true
    else
      puts 'Добавьте поезду маршрут'
      @logic.menu
    end
  end

  def is_cargoTrain_have_route?(index)
    if !@obj.array_cargoTrains[index].route.nil?
      true
    else
      puts 'Добавьте поезду маршрут'
      @logic.menu
    end
  end

  def is_stations?
    if @obj.array_stations.length.positive?
      true
    else
      puts 'Вы не добавили ни одной станции'
      @logic.menu
    end
  end

  def is_min_two_stations?
    if @obj.array_stations.length > 1
      true
    else
      puts 'Маршрут должен состоять из минимум 2 станций'
      puts 'Добавьте как минимум две станции в пункте меню 1'
      @logic.menu
    end
  end

  def is_train_on_station?(index)
    if @obj.array_stations[index].trains.length.positive?
      true
    else
      puts 'На станции нет поездов'
      @logic.menu
    end
  end

  def is_first_or_last_station?(index, index_route)
    if index != 1 && index != @obj.array_routs[index_route - 1].all_station.length - 1
      true
    else
      puts 'Нельзя удалить начальную/конечную станцию'
      @logic.menu
    end
  end

  def is_passengerTrain_have_carriage?(index)
    if @obj.array_passengerTrains[index - 1].array_carriage.length.positive?
      true
    else
      puts 'Добавьте хотя бы один вагон в поезд.'
      puts 'Вагон не был отцеплен.'
      @logic.menu
    end
  end

  def is_cargoTrain_have_carriage?(index)
    if @obj.array_cargoTrains[index - 1].array_carriage.length.positive?
      true
    else
      puts 'Добавьте хотя бы один вагон в поезд.'
      puts 'Вагон не был отцеплен.'
      @logic.menu
    end
  end

  def is_routs?
    if @obj.array_routs.length.positive?
      true
    else
      puts 'Добавьте хотя бы один маршрут'
      @logic.menu
    end
  end
end
