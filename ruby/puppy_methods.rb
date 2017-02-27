class Puppy

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

  def new_trick()
    #new trick stuff  
  end

  def eats_homework
    p "puppy has eaten homework"
  end

end


#DRIVER CODE

fido = Puppy.new
fido.fetch("doll")

fido.speak(3)
fido.roll_over
fido.dog_years(5)
fido.eats_homework





