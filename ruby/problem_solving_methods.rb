
=begin
---------------------------------------------------------
def find_index(array, int_to_find)
  found = false
  array_index = 0
  while array_index < array.size  && !found
    if array[array_index] == int_to_find
      found = true
    else
      array_index += 1
    end
  array_index
  end
end

a = [7,15,2,3,100,11,37]
i = 7

#DRIVER CODE
p find_index(a, i)

--------------------------------------------------------
#pseudocode for bubble sort

make second, empty array
while still elements in first array
  first element == smallest
  compare first element to next element
  if second is smaller, make that new smallest
  check next element 
  until end of first array

  push smallest onto second array
  slice out element from first array
end

--------------------------------------------------------


#DEFINE METHODS
def find_index(array, int_to_find)
  if array.each == int_to_find
    final_value = array.each
    p final_value
  end

#  array.each do |variable|
    
  end
end


#DRIVER CODE
def find_index(array, int_to_find)
  array_index = 0 
  found_index = nil 
  while array_index < array.length 
    if array[array_index] == int_to_find
      p array_index
      found_index = array_index
      array_index += 1 
    else
      array_index += 1 
    end 
  end
  found_index 
end


#DRIVER CODE
a = [7,15,2,3,100,11,37]
i = 3

find_index(a, i)

#-------------------------------------------------


def fib_grow(int)
  fib = [0,1] 
  array_index = 2
    while array_index < int
    fib.push(fib[-2] + fib[-1])
    array_index +=1
    end
  fib 
end

new_fib = fib_grow(100)
p new_fib
puts "last element is #{new_fib.last}"
=end

=begin 
------------------------------------
#pseudocode for bubble sort

make second, empty array
while still elements in first array
  find smallest element in first array
  push that value to end of second array
  find index of that element in first array
  delete element out of first array
  print out new, sorted array



=end


a = [47,15,20,23,100,11,37,11]
b = []

indx = 0 
while a.length != 0 
  b.push(a.min)
  idx_to_delete =  a.index(a.min)
  a.delete_at(idx_to_delete)
end 
puts "The sorted array is #{b}"


