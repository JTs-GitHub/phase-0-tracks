=begin
  
pseudocode for interior designer
--------------------------------
-use symbols to define all labels needing to be kept for each client
-for each symbol, 
  -prompt the user to fill in the value
  -write the value into the appropriate key, doing conversion as necessary
-print the hash back out to the designer
-ask designer if they want to make a change
-if not "none"
  -ask for key name
  -ask for new value
  -write new value
  -print updated hash and then exit

=end


#DEFINE THE HASH
h = {
  name: "",                        #string
  age:  "nil",                     #integer
  number_of_children: "nil",       #integer
  decor_theme: "nil",              #string
  budget: "nil",                   #float
  repeat_customer: "nil",          #boolean
  premium_status: "nil"            #boolean
}

#DRIVER CODE
puts "Welcome to the Interior Designer's Helper 3000"
puts ""

puts "Please enter the following:"
puts ""

# no input validation or error checking at this time. 
puts "Client name?"
h[:name] = gets.chomp
puts "Client's age in years?"
h[:age] = gets.chomp
puts "number of children ('0' if none)?"
h[:number_of_children] = gets.chomp
puts "Type of decor desired?"
h[:decor_theme] = gets.chomp
puts "Anticipated budget?"
h[:budget] = gets.chomp
puts "Have you worked with this client before? (true or false)"
h[:repeat_customer] = gets.chomp
puts "Is this client one of your PREMIUM clients? (true or false)"
h[:premium_status] = gets.chomp


#get input from designer.  note, no validation code (yet)

p h

