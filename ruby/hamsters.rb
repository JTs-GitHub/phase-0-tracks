puts "What is the hamster's name?"
hamster_name = gets.chomp
puts "On a scale of 1-10, how loud is your hamster?"
hamster_volume = gets.chomp.to_i
puts "What color would you say he/she is?"
hamster_color = gets.chomp
puts "Is the hamster a good adoption candidate?  (y/n)"
if gets.chomp=="y"
  adoptable=true
else
  adoptable=false
end
puts "Approximately how old would you guess the hamster is (in years)?"
age = gets.chomp.to_f
if !(age>0) 
  age = nil
end

puts "Summary:"
puts "The hamster's name is #{hamster_name}."
puts "#{hamster_name} is a #{hamster_volume} on a loudness scale from 1-10."
puts "#{hamster_name} is #{hamster_color} colored."
if adoptable
  puts "#{hamster_name} is a good candidate for adoption."
else
  puts "#{hamster_name} is not a good candidate for adoption."
end
if age==nil
  puts "#{hamster_name} is of unknown age."
else
  puts "#{hamster_name} is #{age} years old."
end
