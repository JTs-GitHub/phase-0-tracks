
class Santa

  def initialize
    p "Initializing santa instance ..."
  end

  def speak
    puts "Ho, ho, ho! Haaaappy holidays!"
  end

  def eat_milk_and_cookies(cookie_type)
    puts "That was a good #{cookie_type}!"
  end

end


#DRIVER CODE
year_2016_santa = Santa.new
year_2016_santa.speak
year_2016_santa.eat_milk_and_cookies("sugar")

