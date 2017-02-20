=begin
  
pseudocode for interior designer
--------------------------------
-create an empty hash and use symbols to define all keys needed for each client
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
QED

=end


#DEFINE THE HASH
client = {
  name: "",                        #string
  age:  "nil",                     #integer
  number_of_children: "nil",       #integer
  decor_theme: "nil",              #string
  budget: "nil",                   #float
  repeat_customer: "nil",          #boolean
  premium_status: "nil"            #boolean
}

#DEFINE METHODS

#print out the summary of the client's details by printing each hash value using symbols.
def summarize(h)
  puts "SUMMARY:"
  puts "'name' = #{h[:name]}."
  puts "'age' is  #{h[:age]}."
  puts "'number_of_children' is #{h[:number_of_children]}."
  puts "'decor_theme' is #{h[:decor_theme]}."
  puts "'budget' is $#{h[:budget]}."
  puts "'repeat_customer' is  #{h[:repeat_customer]}"
  puts "'premium_status' is  #{h[:premium_status]}"
  return h
end

#get the initial values from the designer's input, and put them into the hash.
def get_input(h)
    # no input validation or error checking at this time. 
  puts "Client name?"
  h[:name] = gets.chomp
  puts "Client's age in years?"
  h[:age] = gets.chomp.to_i
  puts "number of children ('0' if none)?"
  h[:number_of_children] = gets.chomp.to_i
  puts "Type of decor desired?"
  h[:decor_theme] = gets.chomp
  puts "Anticipated budget?"
  h[:budget] = gets.chomp.to_f
  puts "Have you worked with this client before? (true or false)"
  if gets.chomp == "true"
    h[:repeat_customer] = true
  else 
    h[:repeat_customer] = false
  end
  puts "Is this client one of your PREMIUM clients? (true or false)"
  if gets.chomp == "true"
    h[:premium_status] = true
  else 
    h[:premium_status] = false
  end
  return h
end


#DRIVER CODE

#print welcome message
puts "Welcome to the Interior Designer's Helper 3000"
puts ""
puts "Please enter the following client data:"

# call method to walk the designer through inputing data about the client
get_input(client)

#call method to print out the hash as a summary for review
summarize(client)

#Ask the designer if they want to make a single change
puts "Would you like to make changes to one of the values? (enter 'none' to exit)"
if gets.chomp == 'none'
  puts "Thanks for using the Interior Designer's Helper 3000"
else
  puts "What label would you like to change?"            #need to get the index of the particular label, to know what data type
  key = gets.chomp
  puts "What is the new value for #{key}?"
  value = gets.chomp
  
  #figure out proper data type and then write correct data type to hash for the correct symbol
  if key == "name" || key == "decor_theme"   #data types are strings and don't need to be converted.
    client[key.to_sym] = value
  elsif key == "age" || key == "number_of_children"    #data types are integers, so input string is converted to integer
    client[key.to_sym] = value.to_i
  elsif key == "budget"                                #data type is float, so convert input string to float
    client[key.to_sym] = value.to_f
  elsif value == "true"               #only booleans remain, so set value to true or false.
    client[key.to_sym] = true
  else
    client[key.to_sym] = false
  end
summarize(client)
end

      


