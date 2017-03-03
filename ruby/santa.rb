
class Santa

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

  # getter methods
  def age
    @age 
  end

  def ethnicity
    @ethnicity
  end

  # setter methods 
  def celebrate_birthday=(age)
    puts "Happy Birthday!"
    @age = age + 1
  end

  def get_mad_at=(raindeer_name)
    #change @deer_ranking array order
  end

  def new_gender=(gender)
    @gender = gender
  end

end

santas = []
#DRIVER CODE
year_2016_santa = Santa.new("m", "x")
#year_2016_santa.speak
#year_2016_santa.eat_milk_and_cookies("sugar")

example_genders = ["agender", "female", "bigender", "male", "female", "gender fluid", "N/A"]
example_ethnicities = ["black", "Latino", "white", "Japanese-African", "prefer not to say", "Mystical Creature (unicorn)", "N/A"]
example_genders.length.times do |i|
  santas << Santa.new(example_genders[rand(example_genders.length)], example_ethnicities[rand(example_ethnicities.length)])    #random gender, random ethnicity
end   
p santas[0]
p santas[1]
p santas[2]
puts "age is #{year_2016_santa.age}"
puts "ethnicity is #{year_2016_santa.ethnicity}"
p year_2016_santa.new_gender=("tec's choice")



#now make 50 santas

