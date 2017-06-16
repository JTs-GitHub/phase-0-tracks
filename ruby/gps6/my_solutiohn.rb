# Virus Predictor

# I worked on this challenge [by myself, with: ].
# We spent [#] hours on this challenge.

# EXPLANATION OF require_relative
#
#pulls in data/code from state_data (assumes .rb extension?) and it looks for it in the same directory.
#require expects full path to target file.

require_relative 'state_data'

class VirusPredictor
  #initialize the instance variables for each instantiation of the class object when it's created.
  def initialize(state_of_origin, population_density, population)
    @state = state_of_origin
    @population = population
    @population_density = population_density
  end

  #calls two other methods to print out the # of deaths by state and the speed of the deaths 
  def virus_effects
    predicted_deaths
    speed_of_spread
  end

  private

  #predicts deaths based on arguments, by state
  def predicted_deaths
    # predicted deaths is solely based on population density
    if @population_density >= 200
      multiplier = 0.4
    elsif @population_density >= 150
      multiplier = 0.3    
    elsif @population_density >= 100
      multiplier = 0.2
    elsif @population_density >= 50
      multiplier = 0.1
    else
      multiplier = 0.05
    end
    number_of_deaths = (@population * multiplier).floor 
    print "#{@state} will lose #{number_of_deaths} people in this outbreak"
  end

  #predicts speed of deaths by state based on arguments passed in. 
  def speed_of_spread #in months
    # We are still perfecting our formula here. The speed is also affected
    # by additional factors we haven't added into this functionality.
    speed = 0.0       # this is a useless line of code. speed need not be initialized.

    if @population_density >= 200
      speed += 0.5
    elsif @population_density >= 150
      speed += 1
    elsif @population_density >= 100
      speed += 1.5
    elsif @population_density >= 50
      speed += 2
    else
      speed += 2.5
    end

    puts " and will spread across the state in #{speed} months.\n\n"

  end

end

#=======================================================================

# DRIVER CODE
 # initialize VirusPredictor for each state

STATE_DATA.each do |state_key, population_values|
state_record = VirusPredictor.new(state_key, population_values[:population_density], population_values[:population])
state_record.virus_effects
end

=begin 

alabama = VirusPredictor.new("Alabama", STATE_DATA["Alabama"][:population_density], STATE_DATA["Alabama"][:population])
alabama.virus_effects

jersey = VirusPredictor.new("New Jersey", STATE_DATA["New Jersey"][:population_density], STATE_DATA["New Jersey"][:population])
jersey.virus_effects

california = VirusPredictor.new("California", STATE_DATA["California"][:population_density], STATE_DATA["California"][:population])
california.virus_effects

alaska = VirusPredictor.new("Alaska", STATE_DATA["Alaska"][:population_density], STATE_DATA["Alaska"][:population])
alaska.virus_effects

#=======================================================================

# Reflection Section
-2 different hash syntaxes: 1 uses the rocket assignment, one uses the label shortcut with the colon on the right followed by the value.
-both require and require_relative bring in code/data from the file named in the command, but 'relative' assumes the named file 
is in the same directory as the current ruby file.
-Iterating through a hash?  you can use .each, or .each_pair, .each_key or .each_value ...
-In refactoring virus_effects, what stood out most was the fact that it had no arguments pass into itself, but it called two methods and passed arguments to both of them.
-The concept most solidified in this challenge was the notion of PRIVATE.  I had heard of it, but never seen it in action, nor knew of an instance of how/when it would be used.
=end 