
puts "Write name"
name = gets.chomp

puts "Write height"
height = gets.chomp.to_i

weight = (height - 110) * 1.15

if weight <= 0
  puts "Ваш вес уже оптимальный"
else 
  puts "#{name}, your weight is #{weight} "	
end
