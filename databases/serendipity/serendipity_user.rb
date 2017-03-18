# OPERATION Serendipity

#########################
# THIS RUBY FILE contains code for users to update thier location, and check if anybody in the db is within the threshold distance. 
#########################

# require gems
require 'sqlite3'
require 'faker'
require 'haversine'

 

# create SQLite3 database
# db = SQLite3::Database.new("serendipity.db")
# db.results_as_hash = true    # kept around for reference if I want to turn table into a hash

#db = SQLite3::Database.open('sreendipity.db')


#update member location.
def update_member_location(db, mem_numb, long, lat)
  db.execute("UPDATE serendipity_members SET longitude=#{long}, latitude=#{lat} WHERE id=#{mem_numb};")
end

def rand_long
  (rand * 0.14) - 122.36
end

def rand_lat
  (rand * 0.1) + 37.7
end

def rand_mem_numb
  rand(100) + 1 
end

# DRIVER CODE *************************************************************************************
# test updating member location as a one off.
# rand_mem_numb = 100     # 1-100 integer equates to member number
# rand_long = -47.0       # current range  -122.36 to -122.5  (hunters point to pacific ocean)
# rand_lat = 47.0         # current range  37.7 to 37.8    (outer mission to golden gate)

#  test code to randomly jumble existing member location 200 random reps is ~ 90% of records updated.
# 200.times do
#   update_member_location(db, rand_mem_numb, rand_long, rand_lat)
# end 


# test code to see closest person to one member
#locations = db.execute("select name, longitude, latitude from serendipity_members where id != #{test_member};")  # this gets array of everybody but the test member
#locations = db.execute("select name, longitude, latitude from serendipity_members ;")  # this gets array of everybody locations[0][0]== name, locations[0][1]== longitude, locations[0][2] == latitude 
# puts ("locations[0][0] is #{locations[0][0]}")
# puts ("locations[0][1] is #{locations[0][1]}")
# puts ("locations[0][2] is #{locations[0][2]}")
# puts ("locations[1][0] is #{locations[1][0]}")
# puts ("locations[1][1] is #{locations[1][1]}")
# puts ("locations[1][2] is #{locations[1][2]}")

#distance = Haversine.distance(locations[0][1], locations[0][2], locations[1][1], locations[1][2])
#puts distance.to_miles

200.times do
    update_member_location(db, rand_mem_numb, rand_long, rand_lat)  
end

  update_member_location(db, rand_mem_numb, rand_long, rand_lat)  #run through 3 times and reset location data
  locations = db.execute("select name, longitude, latitude from serendipity_members ;")
  locations.each do |member| 
    distance = Haversine.distance(locations[0][1], locations[0][2], member[1], member[2])
    if distance.to_feet < 3000 
      puts ("GREAT NEWS, #{member[0]} is less than 3000 feet away!")
    end
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

