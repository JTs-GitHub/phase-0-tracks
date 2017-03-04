#Assignment 6.4
=begin 
module Shout
  def self.yell_angrily(words)
    words + "!!!" + " :("
  end
  
  def self.yelling_happily(words)
    words + "!!!" + " :)  8)  ;) "
  end
end

Shout.singleton_methods
puts "------------"
puts Shout.yell_angrily("hi there.   how are you")
puts Shout.yelling_happily("I'm good, thanks for asking")
=end

module Shout
  def outside_voice(words)
    "!!!    " + words.upcase + "!!!"
  end
end

class Cop
  include Shout 
end

class Carnival_Barker
  include Shout
end

officer = Cop.new
puts officer.outside_voice("halt or I'll shoot")
puts "------------"
carnie = Carnival_Barker.new
puts carnie.outside_voice("Come see the most amazing site in the history of mankind...")
