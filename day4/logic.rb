class Logic
  def menu
    puts
    puts '***************************************************'
    puts '| 1 - создать станцию                             |'
    puts '| 2 - создать поезд                               |'
    puts '| 3 - создать маршрут                             |'
    puts '| 4 - назначить маршрут                           |'
    puts '| 5 - добавить вагон к поезду                     |'
    puts '| 6 - отцепить вагон от поезда                    |'
    puts '| 7 - перемещать поезд по маршруту вперед и назад |'
    puts '| 8 - информация                                  |'
    puts '| 0 - выход                                       |'
    puts '***************************************************'
    puts
  end

  def add_station
    puts
    puts '***********************'
    puts '| 1 - создать станцию |'
    puts '| 0 - назад           |'
    puts '***********************'
    puts
  end

  def choose_trains
    puts
    puts '**************************'
    puts '| 1 - пассажирский поезд |'
    puts '| 2 - грузовой поезд     |'
    puts '| 0 - назад              |'
    puts '**************************'
    puts
  end

  def add_train
    puts
    puts '**********************************'
    puts '| 1 - создать пассажирский поезд |'
    puts '| 2 - создать грузовой поезд     |'
    puts '| 0 - назад                      |'
    puts '**********************************'
    puts
  end

  def add_route
    puts
    puts '************************************'
    puts '| 1 - добавить маршрут             |'
    puts '| 2 - добавить станцию в маршрут   |'
    puts '| 3 - удалить станцию из маршрута  |'
    puts '| 0 - назад                        |'
    puts '************************************'
    puts
  end

  def add_route_to_train
    puts
    puts '*********************************************'
    puts '| 1 - добавить маршрут пассажирскому поезду |'
    puts '| 2 - добавить маршрут грузовому поезду     |'
    puts '| 0 - назад                                 |'
    puts '*********************************************'
    puts
  end

  def add_carriage
    puts
    puts '*********************************************'
    puts '| 1 - добавить вагон к пассажирскому поезду |'
    puts '| 2 - добавить вагон к грузовому поезду      |'
    puts '| 0 - назад                                 |'
    puts '*********************************************'
    puts
  end

  def remove_carriage
    puts
    puts '********************************************'
    puts '| 1 - удалить вагон с пассажирского поезда |'
    puts '| 2 - удалить вагон с грузового поезда     |'
    puts '| 0 - назад                                |'
    puts '********************************************'
    puts
  end

  def go
    puts
    puts '***********************************************************'
    puts '| 1 - проехать одну станцию вперед на пассажирском поезде |'
    puts '| 2 - проехать одну станцию назад на пассажирском поезде  |'
    puts '| 3 - проехать одну станцию вперед на грузовом поезде     |'
    puts '| 4 - проехать одну станцию назад на грузовом поезде      |'
    puts '| 0 - назад                                               |'
    puts '***********************************************************'
    puts
  end

  def show_all_station
    puts
    puts '****************************'
    puts '| 1 - показать все станции |'
    puts '| 0 - назад                |'
    puts '****************************'
    puts
  end

  def choose_train
    puts
    puts '***************************'
    puts '| 1 - пассажирские поезда |'
    puts '| 1 - грузовые поезда     |'
    puts '| 0 - назад               |'
    puts '***************************'
    puts
  end

  def show_trains_on_station
    puts
    puts '**********************************'
    puts '| 1 - показать поезда на станции |'
    puts '| 0 - назад                      |'
    puts '**********************************'
    puts
  end

  def information
    puts
    puts '*************************************'
    puts '| 1 - список всех станций           |'
    puts '| 2 - список поездов на станции     |'
    puts '| 3 - список всех поездов           |'
    puts '| 4 - список маршрутов и их станций |'
    puts '| 5 - список вагонов у поезда       |'
    puts '| 0 - назад                         |'
    puts '*************************************'
    puts
  end
end
