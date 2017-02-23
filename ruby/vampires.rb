#Release 5: Interview with the Vampire  (making a change to try to tag Tyler)

puts "How many employees to enter during this session?"
num_of_employees = gets.chomp.to_i

while num_of_employees > 0
  puts "Please enter your name: "
  inputed_name = gets.chomp
  puts "How old are you?"
  age = gets.chomp.to_i
  puts "What year were you born?"
  year_born = gets.chomp.to_i

  current_year = 2017

  age_matches = false
  if (current_year-year_born == age) ||  (current_year-year_born == (age +1))
    age_matches = true
  end


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

=begin
  #debugging puts should be deleted/commented out in final submission
  puts "STARTING VALUES"
  puts "current year is #{current_year}"
  puts "inputed_name is #{inputed_name}"
  puts "age is #{age}"
  puts "age matches    #{age_matches}"
  puts "garlic_bread_eater    #{garlic_bread_eater}"
  puts "insurance    #{insurance}"
  puts vampire_guess
=end

  if age_matches == true
    if garlic_bread_eater == true
      if insurance == true
        vampire_guess = "Probably NOT a vampire"
      end
    end
  elsif (garlic_bread_eater == false) ||  (insurance == false)     #age is wrong/mismatched going into this elsif
      vampire_guess = "Probably a vampire"
      puts vampire_guess
  end

#adding in allergy detection loop
  puts "Please list any allergies (one per line) and then type 'done' when finished."
  allergy = nil
  until allergy == "done" or allergy == "sunshine"
    allergy = gets.chomp
    if allergy == "sunshine"
      vampire_guess = "Probably a vampire"
    end
  end


  if age_matches == false
    if (garlic_bread_eater == false) && (insurance == false)
    vampire_guess = "Almost CERTAINLY a vampire!"
    puts vampire_guess
    end
  end

  if (inputed_name == "Drake Cula") || (inputed_name == "Tu Fang")
    vampire_guess = "Definitely a VAMPIRE!!"
  end



  puts "Current value of vampire guess is ... #{vampire_guess}"
  num_of_employees = num_of_employees - 1
end
puts "Actually, never mind! What do these questions have to do with anything? Let's all be friends."
