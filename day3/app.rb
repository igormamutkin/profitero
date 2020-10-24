require_relative 'train.rb'
require_relative 'station.rb'
require_relative 'route.rb'

train1 = Train.new("1111", "грузовой", 7)
train2 = Train.new("2222", "Пассажирский", 9)
train3 = Train.new("3333", "грузовой", 20)
train4= Train.new("4444", "пассажирский", 5)

station1 = Station.new("станция 1")
station2 = Station.new("станция 2")
station3 = Station.new("станция 3")
station4 = Station.new("станция 4")
station5 = Station.new("станция 5")
station6 = Station.new("станция 6")

route1 = Route.new(station1, station4)
route2 = Route.new(station1, station5)

station1.add_train(train1)
station1.add_train(train2)				
station1.add_train(train3)
station1.add_train(train4)

puts "\nВыводим все поезда"

station1.get_trains 					#Выводим все поезда

puts "\nВыводим только грузовые"

station1.get_trains_for_type("грузовой")   #Выводим только грузовые

puts "\n#отправили поезд номер 1111 и демонстрируем, что его больше нет на станции"

station1.send_train(train1) #отправили поезд и демонстрируем, что его больше нет на станции
station1.get_trains

puts "\nДобавим две станции в первый маршрут and Выведем все станции маршрута"


route1.add_station(station2)                #Добавим две станции в первый маршрут
route1.add_station(station3)   

route1.list_station			#Выведем все станции маршрута

puts "\nудалим последнюю станцию"

route1.remove_station(station4)                   #удалим последнюю станцию

puts "\nВыведем новый список станций"

route1.list_station						#Выведем новый список

puts "\nувеличим скорость поезда номер 1111 (по дефолту 0) на 10 и выведем"

puts train1.pick_up_speed(10)     #увеличим скорость поезда на 10 и выведем
train1.get_speed 

puts "\nуменьшим скорость на 7 и выведем"

train1.slow_down(7)					#уменьшим скорость на 7
train1.get_speed 						#выведем скорость

puts "\nпоказали скольк было вагонов, добавили вагон - вывели, удалили вагон- вывели"

train2.get_car
train2.add_car                #добавили вагонб вывелиб удалили вагонб вывели
train2.get_car
train2.remove_car
train2.get_car

puts "\nДобавим две станции во второй маршрут. Доьавим 3 поезду маршрут и выведем ближайшие станции"

route2.add_station(station5)                #Добавим две станции во второй маршрут
route2.add_station(station6)   


train3.add_route(route2) 				#добавили маршрут 3 поезду
train3.station_info(route2)				#вывели информацию о станции и ближайшей

puts "\nПроехали станцию вперед и вывели инфу о ближ станциях"

train3.run_ahead(route2) 				#Проиехали одну станцию  еще раз вывели инфу
train3.station_info(route2)

puts "\nПроехали станцию назад и вывели инфу о ближ станциях "


train3.run_back(route2)                 #Проехали станцию назад и вывели инфу
train3.station_info(route2)









