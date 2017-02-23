
=begin
  
COMMENTED OUT TO MAKE WAY FOR RELEASE 1

def power                                            #method yields to block in DRIVER section
  puts "we are now at the beginning of the method"  #debug code to track progress
  yield(2 , 3)                                       #pass integers to the block code
  puts "we are now after the block yield statement" #debug code
end

#DRIVER CODE
puts "we are about to call the method with our block"  #debug code
power { |base, exponent| puts base**exponent }         # method call, passing in a block
puts ""
puts "and now we are after the block and method call"   #debug

=end


#RELEASE 1 code .each, .map, and .map!



=begin 
   # commenting out array methods to make way for hash methods.


    #DRIVER CODE 

    # .each sample code for an array
    puts "Now doing .each method"
    todo_list.each do |task|
      task = task + "..."          #add an ellipsis to each item in the array
      puts task
    end
    p todo_list                    #verify the array was or wasn't changed.


    # .map sample code for an array
    puts
    puts "Now doing [safe] map and creating new array"
    new_array = todo_list.map do |task|
      puts task                           #show item before modificatin
      task = task + "."                   # add a period to each item in the array
    end
    p todo_list                              # verify unchanged array
    p new_array                              # verify new array  has the added period on each item.

    # .map! sample code for an array
    puts
    puts "Now doing dangerous map"
    p todo_list
    todo_list.map! do |task|                        #show item before modificatin
      task = task + "---"                   # add 3 hyphens to each item in the array
    end
    p todo_list                              # verify changed array
=end
todo_list = [ "grocery shopping" , "dry cleaning" , "fill car with gas" , "take out trash", "pick up kids from school" ]  

famous_opens = {
    moby_dick: "Call me Ishmael." ,
    tale_of_two_cities: "It was the best of times..." ,
    slaughterhouse_five: "All this happened, more or less." ,
    the_invisible_man: "I am an invisible man."
}

=begin 

        # COMMENTING OUT Release 1 code to make room for Release 2 code

        p famous_opens                                                        # original hash
        puts "Now doing .each on the hash table's values to add elipsis"      
        famous_opens.each do |book, opening_verse|
          puts "#{opening_verse}..."                                          # print out each value plus added ellipsis
        end
        p famous_opens                                                        # debug, expect unchanged hash
        puts                                                                  # debug spacing

        p famous_opens                                                         #original hash
        puts
        puts "Now doing .map on the hash table's values"
        h = famous_opens.map do |book, opening_verse|                          # .map method call on hash, expect new array returned to h with changed values.
          puts "#{opening_verse} ..."
          opening_verse = opening_verse + "     <guess the book title>"
        end
        p famous_opens                                                         #print hash, expect unchanged
        puts                                             
        puts h                                                                    # print new array with changed values 

=end

#iterating method that takes a block && deletes items based on a condition
  #array
    new_a = todo_list.reject { |task| task == "dry cleaning"}
  #hash
    famous_opens.reject! {|book, text| text == "Call me Ishmael."}


#iterating method that takes a block && filters items that satisfy a condition
  # array
    new_a2 = todo_list.find_all { |task| task == "take out trash"}
  # hash
    famous_opens.keep_if { |book, text|  book == :moby_dick || book == :the_invisible_man}


#a different iterating method that takes a block && filters/keeps items based on condition
#array using a new array
a = [1, 2, 3, 4, 5, 0]
a.drop_while { |i| i < 3 }      
#hash using new hash
h = { "a" => 100, "b" => 200, "c" => 300 }
h_new = h.select {|k,v| k > "a"}                     # returns a new hash


#iterating methods that take blocks && removes items from data structure until condition in the block evaluates to false
#array using a new array
b = [1, 2, 3, 4, 5, 0]
b.drop_while {|i| i < 3 }   #=> [3, 4, 5, 0]
#hash 
# can't find method that meets criteria


