a = gets.chomp.to_i
b = gets.chomp.to_i
c = gets.chomp.to_i

flag = (a^2 + b^2 == c^2) || (a^2 + c^2 == b^2) || (b^2 + c^2 == a^2)
res = [a, b, c].uniq

if a == b && b == c
  puts "Треугольник равностронний и равнобедренный"
elsif res.length == 2
  puts "Треугольник равнобедренный"
if flag
  puts "Треугольник прямоугольный"
end
elsif (flag)
  puts "Треугольник прямоугольный"	
end

