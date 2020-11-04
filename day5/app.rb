require_relative 'station'
require_relative 'passengerTrain'
require_relative 'cargoTrain'
require_relative 'carriage'

carriage1 = Carriage.new

station1 = Station.new('Moscow')
station2 = Station.new('Minsk')
station3 = Station.new('Mincsk')
station4 = Station.new('Minccsk')
station5 = Station.new('Minccdedesk')

train1 = Train.new(1111)
train2 = Train.new(2222)

train3 = PassengerTrain.new(3333)

train4 = CargoTrain.new(4444)
train5 = CargoTrain.new(5555)

route1 = Route.new('aaa', station1, station2)
route2 = Route.new('bbb', station3, station4)

#
# Создать модуль, который позволит указывать название компании-производителя
# и получать его. Подключить модуль к классам Вагон и Поезд
#

train1.manufacturer_name = 'adidas'
train1.show_manufacturer_name
carriage1.manufacturer_name = 'puma'
carriage1.show_manufacturer_name
puts ''

#
# В классе Station (жд станция) создать метод
# класса all, который возвращает все станции (объекты), созданные на данный момент
#

station1.all
puts ''

#
# В классе Train создать метод класса find, который принимает номер поезда (указанный при его создании)
# и возвращает объект поезда по номеру или nil, если поезд с таким номером не найден.
#

Train.find(2222)
puts ''

# Создать модуль InstanceCounter и т.д.

station1.show_module # должно быть 5, так как создано 5 станций
train1.show_module # должно быть 2, так как 2 поезда
train3.show_module # один, так как именно пассажирский поезд создан один
train4.show_module # два
route2.show_module # два
