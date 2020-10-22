arr = []

(10..100).each do |flag|
  if flag % 5 == 0
    arr << flag
  end
end

puts arr
