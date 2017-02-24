
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
#pseudocode for insertion sort

      for i ← 1 to length(A)
          j ← i
          while j > 0 and A[j-1] > A[j]
              swap A[j] and A[j-1]
              j ← j - 1
          end while
      end for

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
=end

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





