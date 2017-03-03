
class Santa
  attr_reader :age, :ethnicity              #getter methods
  attr_accessor  :gender 

  def initialize (gender, ethnicity)
    p "Initializing santa instance ..."
    @age = 0
    @gender = gender
    @ethnicity = ethnicity
    @deer_ranking = ["Rudolph", "Dasher", "Dancer", "Prancer", "Vixen", "Comet", "Cupid", "Donner", "Blitzen"]
  end

  def speak
    puts "Ho, ho, ho! Haaaappy holidays!"
  end

  def eat_milk_and_cookies(cookie_type)
    puts "That was a good #{cookie_type}!"
  end

  def celebrate_birthday=(years)
    puts "Happy Birthday number #{years}!"
    @age = years 
  end

  def get_mad_at=(raindeer_name)
    puts "old deer ranking was #{@deer_ranking}"
    @deer_ranking.delete(raindeer_name)           #remove it from wherever it is
    @deer_ranking << raindeer_name                #then add it to the end of the shortened array
    puts "New deer ranking is #{@deer_ranking}"
  end


end

santas = []
#DRIVER CODE

#example_genders = ["agender", "female", "bigender", "male", "female", "gender fluid", "N/A"]
#example_ethnicities = ["black", "Latino", "white", "Japanese-African", "prefer not to say", "Mystical Creature (unicorn)", "N/A"]
#example_genders.length.times do |i|
#  santas << Santa.new(example_genders[rand(example_genders.length)], example_ethnicities[rand(example_ethnicities.length)])    #random gender, random ethnicity
#end   
bill = Santa.new("m", "x")

puts "age is #{bill.age}"
bill.celebrate_birthday = 3                                              #setter method using tradition equation
puts "age is now #{bill.age}"

puts "gender is #{bill.gender}"
puts "Bill is changing his gender to #{bill.gender='self choice'}"       #setter method called within interpolation
puts "gender is now #{bill.gender}"

bill.get_mad_at = "Dasher"                                               #setter method using traditional equation





#now make 50 santas

