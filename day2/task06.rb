name = []
price = []
amount = []
array = {}
all_price = 0

while (true)
  flag = gets.chomp.to_s
	if flag.eql?("стоп")
	  break
	end
  name << flag
  price << gets.chomp.to_i
  amount <<  gets.chomp.to_f
end

name.length.times do |i|
	array_prom = {}
	array_prom[price[i]] = amount[i]
	array[name[i]] = array_prom
end

array.each do |key, value|
  flag = 0
	value.each do |a, b|
	  flag = a * b
	  all_price += flag
	end
  puts "#{key} - #{flag}$"
end

puts all_price







