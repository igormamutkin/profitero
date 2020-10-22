arr = [0, 1]
max = 0

while(max < 100) 
  arr << max
  max = arr.last + arr[arr.length-2]
end
