array = { а: 0 , е: 0, и: 0, о: 0, у: 0, ы: 0, э: 0, ю: 0, я: 0}

res = 0;

(:а..:я).each  do |flag|
  res +=1
    if array.key?(flag)
      array[flag] = res
    end
end
