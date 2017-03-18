# OPERATION Serendipity

#########################
# THIS RUBY FILE contains code for users to update their location, and check if anybody in the db is within the threshold distance. 
#########################

# require gems
require 'sqlite3'
#require 'faker'
require 'haversine'


db = SQLite3::Database.open('serendipity.db')


#update member location method.   requires member to already be in db table "serendipity_members"
def update_member_location(db, mem_numb, long, lat)
  db.execute("UPDATE serendipity_members SET longitude=#{long}, latitude=#{lat} WHERE id=#{mem_numb};")
end

# the random member and random location methods are used to simulate 
# real world updating of locations (e.g. from phones or such).  Currently limiting to SF area. 

def rand_long                  # current range  -122.36 to -122.5  (hunters point to pacific ocean)
  (rand * 0.14) - 122.36
end

def rand_lat                   # current range  37.7 to 37.8    (outer mission district to golden gate)
  (rand * 0.1) + 37.7
end

def rand_mem_numb              # 1-100 integer equates to member number
  rand(100) + 1 
end

# randomly shuffle members to new locations, simulating a gap in time when user gets the latest db results.
def update_all_members
  200.times do
    update_member_location(db, rand_mem_numb, rand_long, rand_lat)
  end
end



# DRIVER CODE *************************************************************************************

#update_all_members

puts ("Welcome to Serendipity 2017:   the social networking program that gives 'chance' a slightly higher profile.")
puts ("The goal of Serendipity Inc. is to let each of its members know if they are close to other members of their social network.")
puts ("Serendipity will tell you if a friend or co-worker is at the same sporting event, or on the same BART, or at a coffee shop just down the street...")
puts ("In the near future, you can be part of multiple groups, each one notifying you and them of your proximity.")
puts 
puts ("Please enter your merbership number:")
mem_numb = gets.chomp.to_i 
puts mem_numb 
name = db.execute("select name from serendipity_members where id=#{mem_numb} ;")  # this gets array of array of name.  name = [["Ted Stamps"]] 
puts ("Welcome back #{name[0][0]}")
puts
puts
puts ("What would you like to do?")

while true 
  puts
  puts ("enter 'c' to check for current status, 'u' to update your current location, 'a' to update all status, or 'q' to quit:")
  user_choice = gets.chomp
  puts
  if user_choice == 'c'
    puts user_choice
  elsif user_choice == 'u' 
    puts "u"
  elsif user_choice == 'a' 
    puts "a"
  elsif user_choice == 'q'
    puts ("Thanks for using Serendipity 2017")
    break
  end
end 

#get array of everybody and their location, including current user.
#locations = db.execute("select name, longitude, latitude from serendipity_members ;")  # this gets array of everybody 


# get array of everybody except the current user => locations[0][0]== name, locations[0][1]== longitude, locations[0][2] == latitude 
#locations = db.execute("select name, longitude, latitude from serendipity_members where id != #{current_member_id};")  

# puts ("locations[0][0] is #{locations[0][0]}")
# puts ("locations[0][1] is #{locations[0][1]}")
# puts ("locations[0][2] is #{locations[0][2]}")
# puts ("locations[1][0] is #{locations[1][0]}")
# puts ("locations[1][1] is #{locations[1][1]}")
# puts ("locations[1][2] is #{locations[1][2]}")

# p locations[1]
 

#distance = Haversine.distance(locations[0][1], locations[0][2], locations[1][1], locations[1][2])
#puts distance.to_miles

# locations.each do |x| 
#   distance = Haversine.distance(x[1], x[2], locations[current_member_id][1], locations[current_member_id][2])
#   if (distance.to_feet < 3000) & (x[0] != 'Felipa Gulgowski') 
#     puts ("GREAT NEWS , #{x[0]} is less than 3000 feet away!")
#   end
# end

#  puts ("distance to #{member[0]} is #{distance.to_miles} miles.")

#test code to see if distance calculations work from haversine gem
# distance = Haversine.distance(35.61488, 139.5813, 48.85341, 2.3488)
# distance.class => Haversine::Distance
# distance.to_miles => 6032.71091869803
# distance = Haversine.distance(rand_long, rand_lat, rand_long, rand_lat)
# puts ("the distance is #{distance}")
# puts ("in miles it is #{distance.to_miles}")
# puts ("in feet it is #{distance.to_feet.floor}")


# explore ORM by retrieving data
# kittens = db.execute("SELECT * FROM kittens")
# kittens.each do |kitten|
#  puts "#{kitten['name']} is #{kitten['age']}"
# end

