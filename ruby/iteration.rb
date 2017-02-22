#DEFINE METHODS
def power                                            #method yields to block in DRIVER section
  puts "we are now at the beginning of the method".  #debug code to track progress
  yield(2 , 3)                                       #pass integers to the block code
  puts "we are now after the block yeild statement". #debug code
end

#DRIVER CODE
puts "we are about to call the method with our block"  #debug code
power { |base, exponent| puts base**exponent }         # method call, passing in a block
puts
puts "and now we are after the block and method call"   #debug