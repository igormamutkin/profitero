a = gets.chomp.to_i
b = gets.chomp.to_i
c = gets.chomp.to_i

d = b^2 - 4 * a * c
x = -b / (2 * a)
x1 = (-b - Math.sqrt(d)) / (2 * a)
x2 = (-b + Math.sqrt(d)) / (2 * a)

if d < 0 
  puts "Дискриминант = #{d}, корней нет"
elsif d == 0
  puts "Дискриминант = #{d}, корень = #{x}"
else
  puts "Дискриминант = #{d}, корни #{x1} и #{x2}"
end
#агрмовгалро
		