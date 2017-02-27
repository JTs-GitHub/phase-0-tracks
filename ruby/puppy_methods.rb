class Puppy

  def initialize
    p "Initializing new puppy instance ..."
  end

  def fetch(toy)
    puts "I brought back the #{toy}!"
    toy
  end

  def speak(num_of_barks)
    puts "woof " * num_of_barks
  end

  def roll_over
    puts "rolled over"
  end

  def dog_years(human_years)
    p 7 * human_years
  end

  def eats_homework
    p "puppy has eaten homework"
  end
end



class Car

  def initialize
    p "Initializing new car smell ..."
  end

  def honk(duration)
    puts "the horn honked for #{duration} seconds"
  end

  def accellerating
    puts "the car is speeding UP! "
  end

end

#DRIVER CODE
=begin

  fido = Puppy.new
  fido.fetch("doll")

  fido.speak(3)
  fido.roll_over
  fido.dog_years(5)
  fido.eats_homework

=end


#betty = Car.new
#betty.honk(5)
#betty.accellerating

car_list = []
count = 0
until count == 50
  car_list << Car.new 
  count += 1
end

car_list.each do |car|
  car.honk(2)
  car.accellerating 
end
