require_relative 'train.rb'
require_relative 'station.rb'
require_relative 'route.rb'

train1 = Train.new("1111", "грузовой", 7)
train2 = Train.new("2222", "Пассажирский", 9)
train3 = Train.new("3333", "грузовой", 20)
train4= Train.new("4444", "пассажирский", 5)

station1 = Station.new("Московская")
station2 = Station.new("Восток")
station3 = Station.new("Уручча")
station4 = Station.new("Спортивная")

route1 = Route.new(station1, station4)

puts "Добавим в маршрут 1 еще две станции, и выведем все станции маршрута\n "

route1.add_station(station2)
route1.add_station(station3)
route1.list_station

puts "\nУдалим станцию номер 3\n "

route1.remove_station(station3)
route1.list_station

#Добавим первому поезду маршрут номер

train1.add_route(route1)

puts "\nНа станции номер 1 появился этот поезд\n "

station1.show_trains

#отправим поезд на 1 станцию вперед

train1.go_next

puts "\nПосле отправки поезда на следующую станцию\n "

station1.show_trains
station2.show_trains

#отправим поезд на 1 станцию назад
train1.go_back

puts "\nПосле отправки поезда на следующую станцию\n "

station1.show_trains
station2.show_trains

puts "\nПокажем ближайшие станции поезда\n "

train1.station_info

#Дальше реализация простых методов

puts "\nвеличим скорость первого поезда на 10 (по дефолту 0), потом уменьшим на 7\n "

train1.pick_up_speed(10)
train1.get_speed
train1.slow_down(7)
train1.get_speed
train1.slow_down(3)

#То же самое с вагонами

train1.add_carriage
train1.get_carriage
train1.remove_carriage
train1.get_carriage

puts "\nПолучим список грузовых поездов\n "

station4.add_train(train1)
station4.add_train(train2)				
station4.add_train(train3)
station4.add_train(train4)


station4.get_trains_by_type("Грузовой")




















