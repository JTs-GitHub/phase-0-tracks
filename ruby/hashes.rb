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
p h
puts h.length
