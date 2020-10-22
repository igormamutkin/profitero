name_list = []
price_list = []
amount_list = []
hash_list = {}
all_price = 0

while (true)
  flag = gets.chomp.to_s
  break if flag.eql?("стоп")
  name_list << flag
  price_list << gets.chomp.to_i
  amount_list <<  gets.chomp.to_f
end

name_list.each_with_index do |element, index|
  array_prom = {}
  array_prom[price_list[index]] = amount_list[index]
  hash_list[element] = array_prom
end

hash_list.each do |name, value|
  flag = 0
  value.each do |price, amount|
	flag = price * amount
    all_price += flag
  end
  puts "#{name} - #{flag}$"
end

puts all_price







