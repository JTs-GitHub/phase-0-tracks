#Release 1: Interview with the Vampire

puts "Please enter your name: "
inputed_name = gets.chomp
puts "How old are you?"
age = gets.chomp.to_i
puts "What year were you born?"
year_born = gets.chomp.to_i

age_matches = false
if (2017-year_born == age) ||  (2017-year_born == (age +1))
  age_matches = true


puts "Our company cafeteria serves garlic bread.  Should we order some for you? (yes/no)"
if gets.chomp == "yes" 
  garlic_bread_eater = true
else
  garlic_bread_eater = false
end

puts "Would you like to enroll in the company's health insurance?  (yes/no)"
if gets.chomp == "yes"
  insurance = true
else
  insurance = false
end

vampire_guess = "Results Inconclusive" #set default to inconclusive, then update as info is processed.


if age_matches == true
  if garlic_bread_eater == true
    if insurance == true
      vampire_guess = "Probably NOT a vampire"
    end
  end
elsif (garlic_bread_eater == false) ||  (insurance == false)     #age is wrong/mismatched going into this elsif
    vampire_guess = "Probably a vampire"
elsif (garlic_bread_eater == false) && (insurance == false)
  vampire_guess = "Almost CERTAINLY a vampire!"
end


if inputed_name == "Drake Cula" || inputed_name == "Tu Fang"
vampire_guess = "Definitely a VAMPIRE!" 
end

puts vampire_guess
