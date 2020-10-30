require_relative 'train'
require_relative 'station'
require_relative 'route'
require_relative 'passengerTrain'
require_relative 'cargoTrain'
require_relative 'cargoCarriage'
require_relative 'passengerCarriage'
require_relative 'logic'
require_relative 'information'
require_relative 'check'

logic = Logic.new
information = Information.new
check = Check.new(information, logic)

logic.menu

while (flag = gets.chomp.to_i) != 0

  case flag

  when 1
    logic.add_station
    case num = gets.chomp.to_i
    when 1
      print 'Введите название станции: '
      name = gets.chomp.to_s
      puts "Станция #{name} добавлена."
      information.array_stations << Station.new(name)
      logic.menu
    when 0
      logic.menu
    else
      puts 'Некорректные данные'
      logic.menu
    end

  when 2
    logic.add_train
    case num = gets.chomp.to_i
    when 1
      print 'Введите номер поезда: '
      number = gets.chomp.to_s
      information.array_passengerTrains << PassengerTrain.new(number)
      puts "Поезд #{number} добавлен."
      logic.menu
    when 2
      print 'Введите номер поезда: '
      number = gets.chomp.to_s
      information.array_cargoTrains << CargoTrain.new(number)
      puts "Поезд #{number} добавлен."
      logic.menu
    when 0
      logic.menu
    else
      puts 'Некорректные данные'
      logic.menu
    end

  when 3
    logic.add_route
    case res = gets.chomp.to_i
    when 1
      if check.is_min_two_stations?
        print 'Введите название маршрута: '
        name_route = gets.chomp.to_s
        puts 'Выберите начальную станцию: '
        information.show_stations_with_index
        first_statition = gets.chomp.to_i
        print 'Выберите конечную станцию: '
        information.show_stations_with_index
        last_statition = gets.chomp.to_i
        puts 'Маршрут добавлен'
        information.array_routs << Route.new(name_route, information.array_stations[first_statition - 1],
                                             information.array_stations[last_statition - 1])
        logic.menu
      end
    when 2
      if check.is_routs?
        puts 'Выберите маршрут, в который хотите добавить станцию'
        information.show_routs_with_index
        index_route = gets.chomp.to_i
        puts 'выберите станцию для добавления'
        information.show_stations_with_index
        indext_station = gets.chomp.to_i

        route = information.array_routs[index_route - 1]
        station = information.array_stations[indext_station - 1]

        if route.all_station.include?(station)
          puts 'Станция уже есть в маршруте.'
          puts 'Станция не добавлена.'
        else
          route.add_station(station)
          puts 'Станция добавлена в маршрут'
        end
        logic.menu
      end
    when 3
      if check.is_routs?
        puts 'Выберите маршрут, в котором хотите удалить станцию'
        information.show_routs_with_index
        index_route = gets.chomp.to_i
        if information.array_routs[index_route - 1].all_station.length > 2
          puts 'выберите станцию для удаления'
          information.stations_of_routs(information.array_routs[index_route - 1])
          res1 = gets.chomp.to_i
          if check.is_first_or_last_station?(res1, index_route)
            station = information.array_routs[index_route - 1].all_station[res1 - 1]
            information.array_routs[index_route - 1].remove_station(station)
            puts 'Станция удалена из маршрута'
            logic.menu
          end
        else
          puts 'Слишком мало станций в маршруте'
          logic.menu
        end
      end
    when 0
      logic.menu
    else
      puts 'Некорректные данные'
      logic.menu
    end

  when 4
    logic.add_route_to_train
    case num = gets.chomp.to_i
    when 1
      if check.is_passengerTrain? && check.is_routs?
        puts 'Выберите поезд, к которому хотите добавить маршрут'
        information.show_passengerTrains_with_index
        res = gets.chomp.to_i
        puts 'Выберите маршрут, который хотите добавить'
        information.show_routs_with_index
        res2 = gets.chomp.to_i
        information.array_passengerTrains[res - 1].add_route(information.array_routs[res2 - 1])
        puts 'Маршрут добавлен к поезду'
        logic.menu
      end
    when 2
      if check.is_cargoTrain? && check.is_routs?
        puts 'Выберите поезд, к которому хотите добавить маршрут'
        information.show_cargoTrains_with_index
        res = gets.chomp.to_i
        puts 'Выберите маршрут, который хотите добавить'
        information.show_routs_with_index
        res2 = gets.chomp.to_i
        information.array_cargoTrains[res - 1].add_route(information.array_routs[res2 - 1])
        puts 'Маршрут добавлен к поезду'
        logic.menu
      end
    when 0
      logic.menu
    else
      puts 'Некорректные данные'
      logic.menu
    end

  when 5
    logic.add_carriage
    case num = gets.chomp.to_i
    when 1
      if check.is_passengerTrain?
        puts 'Выберите поезд, к которому хотите добавить вагон'
        information.show_passengerTrains_with_index
        res = gets.chomp.to_i
        carriage = PassengerCarriage.new
        information.array_passengerCarriags << carriage
        information.array_passengerTrains[res - 1].add_carriage(carriage)
        puts 'Вагон добавлен'
        logic.menu
      end
    when 2
      if check.is_cargoTrain?
        puts 'Выберите поезд, к которому хотите добавить вагон'
        information.show_cargoTrains_with_index
        res = gets.chomp.to_i
        carriage = CargoCarriage.new
        information.array_cargoCarriags << carriage
        information.array_cargoTrains[res - 1].add_carriage(carriage)
        puts 'Вагон добавлен'
        logic.menu
      end
    when 0
      logic.menu
    else
      puts 'Некорректные данные'
      logic.menu
    end

  when 6
    logic.remove_carriage
    case num = gets.chomp.to_i
    when 1
      if check.is_passengerTrain?
        puts 'Выберите поезд, у которого хотите удалить вагон'
        information.show_passengerTrains_with_index
        res = gets.chomp.to_i
        if check.is_passengerTrain_have_carriage?(res - 1)
          information.array_passengerTrains[res - 1].remove_carriage(information.array_passengerCarriags.last)
          information.array_passengerCarriags.delete(information.array_passengerCarriags.last)
          puts 'Отцеплен один вагон'
          logic.menu
        end
      end
    when 2
      if check.is_cargoTrain?
        puts 'Выберите поезд, у которого хотите удалить вагон'
        information.show_cargoTrains_with_index
        res = gets.chomp.to_i
        if check.is_cargoTrain_have_carriage?(res - 1)
          information.array_cargoTrains[res - 1].remove_carriage(information.array_cargoCarriags.last)
          information.array_cargoCarriags.delete(information.array_cargoCarriags.last)
          puts 'Отцеплен один вагон'
          logic.menu
        end
      end
    when 0
      logic.menu
    else
      puts 'Некорректные данные'
      logic.menu
    end

  when 7
    logic.go
    case num = gets.chomp.to_i
    when 1
      if check.is_passengerTrain?
        puts 'Выберите поезд'
        information.show_passengerTrains_with_index
        res = gets.chomp.to_i
        if check.is_passengerTrain_have_route?(res - 1)
          information.array_passengerTrains[res - 1].go_next
          puts 'Поезд на следующей станции'
          logic.menu
        end
      end
    when 2
      if check.is_passengerTrain?
        puts 'Выберите поезд'
        information.show_passengerTrains_with_index
        res = gets.chomp.to_i
        if check.is_passengerTrain_have_route?(res - 1)
          information.array_passengerTrains[res - 1].go_back
          puts 'Поезд на предыдущей станции'
          logic.menu
        end
      end
    when 3
      if check.is_cargoTrain?
        puts 'Выберите поезд'
        information.show_cargoTrains_with_index
        res = gets.chomp.to_i
        if check.is_cargoTrain_have_route?(res - 1)
          information.array_cargoTrains[res - 1].go_next
          puts 'Поезд на следующей станции'
          logic.menu
        end
      end
    when 4
      if check.is_cargoTrain?
        puts 'Выберите поезд'
        information.show_cargoTrains_with_index
        res = gets.chomp.to_i
        if check.is_cargoTrain_have_route?(res - 1)
          information.array_cargoTrains[res - 1].go_back
          puts 'Поезд на предыдущей станции'
          logic.menu
        end
      end
    when 0
      logic.menu
    else
      puts 'Некорректные данные'
      logic.menu
    end

  when 8
    logic.information
    case num = gets.chomp.to_i

    when 1
      if check.is_stations?
        information.show_stations
        logic.menu
      end

    when 2
      if check.is_stations?
        puts 'Выберите станцию'
        information.show_stations_with_index
        res = gets.chomp.to_i
        if check.is_train_on_station?(res - 1)
          information.array_stations[res - 1].show_trains
          logic.menu
        end
      end

    when 3
      if check.is_train?
        logic.choose_train

        case res = gets.chomp.to_i
        when 1
          if check.is_passengerTrain?
            information.show_passengerTrains
            logic.menu
          end
        when 2
          if check.is_cargoTrain?
            information.show_cargoTrains
            logic.menu
          end
        when 3
          information.show_passengerTrains
          information.show_cargoTrains
          logic.menu
        when 0
          logic.menu
        end
      end

    when 4
      if check.is_routs?
        information.show_routs_with_index
        res = gets.chomp.to_i
        information.array_routs[res - 1].list_stations
        logic.menu
      end
    when 5
      logic.choose_trains
      case res = gets.chomp.to_i
      when 1
        if check.is_passengerTrain?
          information.show_passengerTrains_with_index
          print 'Выберите поезд: '
          res2 = gets.chomp.to_i
          information.array_passengerTrains[res2 - 1].get_array_carriage
          logic.menu
        end

      when 2
        if check.is_cargoTrain?
          information.show_cargoTrains_with_index
          print 'Выберите поезд: '
          res2 = gets.chomp.to_i
          information.array_cargoTrains[res2 - 1].get_array_carriage
          logic.menu
        end
      when 0
        logic.menu
      else
        puts 'Некорректные данные'
        logic.menu
      end

    when 0
      logic.menu
    else
      puts 'Некорректные данные'
      logic.menu
    end
  else
    puts 'Некорректные данные'
    logic.menu
  end
end
