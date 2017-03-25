# OPERATION Serendipity

#########################
# THIS RUBY FILE contains code for users to update their location, and 
# check if anybody in the db is within the threshold distance. 
#########################

# require gems
require 'sqlite3'
require 'haversine'

require_relative 'banners'


#update member location method.   requires member to already be in db table "serendipity_members"
def update_member_location(db, id, long, lat)
  db.execute("UPDATE serendipity_members SET longitude=#{long}, latitude=#{lat} WHERE id=#{id};")
end

def update_all_members (db)
  200.times do
    update_member_location(db, rand_mem_numb, rand_long, rand_lat)
  end
end

def user_array_to_hash (user_a)
  user_h = {}
  user_h[:id] = user_a[0][0]
  user_h[:name] = user_a[0][1]
  user_h[:longitude] = user_a[0][2]
  user_h[:latitude] = user_a[0][3]
  return user_h 
end

# the random member and random location methods are used to simulate 
# real world updating of locations (e.g. from phones or such).  Currently limiting to SF area. 
def rand_long                  # current range  -122.36 to -122.5  (hunters point to pacific ocean)
  (rand * 0.14) - 122.36
end

def rand_lat                   # current range  37.7 to 37.8    (outer mission district to golden gate)
  (rand * 0.1) + 37.7
end

def rand_mem_numb              # 1-100 integer equates to member number.  in future, consider setting rand to table size.
  rand(100) + 1 
end

# DRIVER CODE *************************************************************************************

db = SQLite3::Database.open('serendipity.db')        #assumes serendipity.db already exists, and serendipity_members table exists.
db.results_as_hash = false 
update_all_members (db)  #simulates members updating their locations since current user last ran serendipity app.


# Login the current user based on their serendipity membership number. 
print_user_banner
puts ("Please enter your membership number:")
current_user_num = gets.chomp.to_i                 #assumes valid entry of valid id number
current_user_info_as_array = db.execute("SELECT id, name, longitude, latitude FROM serendipity_members WHERE id=#{current_user_num} ;") 
current_user_info_as_hash = user_array_to_hash (current_user_info_as_array)
puts
puts ("Welcome back #{current_user_info_as_hash[:name]}.")
puts
other_members = db.execute("SELECT name, longitude, latitude FROM serendipity_members WHERE id != #{current_user_num};")  


while true 
  puts ("checking current status since you last updated Serendipity...")
  puts
  at_least_one_near = false
  other_members.each do |other_member| 
    distance = Haversine.distance(other_member[1], other_member[2], current_user_info_as_hash[:longitude], current_user_info_as_hash[:latitude])   #find distance between other members, and current user.
    if (distance.to_feet < 2000)                                                     #threshold currently 3000 feet.
      puts ("GREAT NEWS , #{other_member[0]} is less than 2000 feet away!")
      at_least_one_near = true
    end
  end
  if !at_least_one_near
    puts ("Sorry, but there is nobody from Serendipity near you right now.  Try again later.")
  end
  puts
  puts ("(enter  'u' to update your current location,    'q' to quit:)")
  user_choice = gets.chomp
  puts
  if user_choice == 'u'
    update_member_location(db, current_user_num, rand_long, rand_lat)     #update with random location to simulate new location.
    current_user_info_as_array = db.execute("SELECT id, name, longitude, latitude FROM serendipity_members WHERE id=#{current_user_num} ;") 
    current_user_info_as_hash = user_array_to_hash (current_user_info_as_array)
  elsif user_choice == 'q'
    puts ("Thanks for using Serendipity 2017")
    break
  end
end 
 
