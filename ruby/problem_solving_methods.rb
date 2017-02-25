#---------------------------------------------------------
# RELEAES 0  SIMPLE SEARCH

#DEFINE METHODS
def find_index(array, int_to_find)
  array_index = -1                          # starting at -1 so I can increment at beginning of while loop
  found_index = nil                         
  while array_index < array.length          # search every element in the array
    array_index += 1                        # increment index
    if array[array_index] == int_to_find    # if array element is equal to the integer we're searching for
      found_index = array_index                #set the found_index for return
    end 
  end
  found_index                                #return the found_index    expect either an integer or a nil
end


#DRIVER CODE
a = [7,15,2,3,100,11,37]                    # array with prefilled integers to search
i = 3                                       # the integer to search for in the array

found = find_index(a, i)                    # call the method with array "a" and integer "i"
if found == nil                             # boolean to tell user if 'nil' was returned (instead of blank line)
  puts "The returned index is 'nil'"
else 
  "The returned index is #{found}"           # otherwise, print out the index of the found integer
end


#-------------------------------------------------

#########  Release 1 Code   Fibonacci  ###########

#DEFINE METHO"DS

def fib_grow(int)                      
  fib = [0,1]                        # define base array
  array_index = 2                    # set index=2 because that will be the index of the next number to push
    while array_index < int          # our passed integer is also our index limit
    fib.push(fib[-2] + fib[-1])      #add the last two integers in the current array, then push the result 
    array_index +=1                  #increment counter
    end
  fib                                #pass back this modified array 
end

#DRIVER CODE
new_fib = fib_grow(100)                 #call method feb_grow, with integer, and return the array of fibonacci numbers.

if new_fib.last == 218922995834555169026                           # checking expected value for input of 100
  puts "SUCCESS !!!  The 100th element matches expectations"       #print out success banner
  puts
end
puts "The Fibonacci array for 100 elements is #{new_fib}"          #print out the new array

#------------------------------------
#BEGIN RELEASE 2  Sort an Array

=begin

#pseudocode for bubble sort

populate firt array with integers
make second, empty array
while still elements in first array
  find smallest element in first array
  push that value to end of second array
  find index of that element in first array
  delete element out of first array
print out new, sorted array
=end

a = [47,15,20,23,100,11,37,11]                #original array
b = []

indx = 0 
while a.length != 0 
  b.push(a.min)
  idx_to_delete =  a.index(a.min)
  a.delete_at(idx_to_delete)
end 
puts "The sorted array is #{b}"

