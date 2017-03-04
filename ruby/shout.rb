#Assignment 6.4

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