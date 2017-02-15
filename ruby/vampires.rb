#Release 1: Interview with the Vampire

puts "Please enter your name: "
inputed_name=gets.chomp
puts "How old are you?"
age=gets.chomp.to_i
puts "What year were you born?"
year_born=gets.chomp.to_i

#if current year minus birth year >=2 then something is fishy

puts "Our company cafeteria serves garlic bread.  Should we order some for you? (yes/no)"
if gets.chomp == "yes" 
  garlic_bread_eater= true
else
  garlic_bread_eater = false
end

puts "Would you like to enroll in teh company's health insurannce?  (yes/no)"
insurance = gets.chomp
