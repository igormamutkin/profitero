puts "Day"
day = gets.chomp.to_i
puts "Month"
month = gets.chomp.to_i
Puts "Year"
year = gets.chomp.to_i

months = { 
	jan: 31, 
	feb: 28, 
	mar: 31, 
	apr: 30, 
	may: 31, 
	jun: 30, 
	jul: 31, 
	aug: 31, 
	sep: 30, 
	oct: 31, 
	nov: 30, 
	dec: 31}

flag = 1;
result = 0;

def vis_year(year)       
  if year % 4 != 0
    false
  elsif year % 100 == 0
	true
  elsif year % 400 == 0
	true
  else 
    true
  end
end

months[:feb] = 29 if vis_year(year)

months.each_key do |key|
  if flag < month
	result += months[key]
	flag += 1
  end
end

puts result += day



