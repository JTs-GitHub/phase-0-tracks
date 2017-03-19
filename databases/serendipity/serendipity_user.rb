# OPERATION Serendipity

#########################
# THIS RUBY FILE contains code for users to update their location, and check if anybody in the db is within the threshold distance. 
#########################

# require gems
require 'sqlite3'
#require 'faker'
require 'haversine'


#update member location method.   requires member to already be in db table "serendipity_members"
def update_member_location(db, mem_numb, long, lat)
  db.execute("UPDATE serendipity_members SET longitude=#{long}, latitude=#{lat} WHERE id=#{mem_numb};")
end

def get_current_user_info (db, id_num)

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
def update_all_members (db)
  200.times do
    update_member_location(db, rand_mem_numb, rand_long, rand_lat)
  end
end



# DRIVER CODE *************************************************************************************

db = SQLite3::Database.open('serendipity.db')        #assumes serendipity.db already exists, and serendipity_members table exists.
update_all_members (db)  #simulates members updating their locations since serendipity last run by user.

puts ("      ****************************")
puts ("      *                          *")
puts ("      *    SERENDIPITY 2017      *       the social networking program that gives 'chance' a slightly higher profile.")
puts ("      *                          *")
puts ("      ****************************")
puts
puts
puts
puts ("                   Welcome to Serendipity 2017:")
puts ("     The goal of Serendipity Inc. is to let each of its members know ")
puts ("     if they are close to other members of their social network.")
puts ("     Serendipity will tell you if a friend or co-worker is at the same sporting ")
puts ("     event, or on the same BART, or at a coffee shop just down the street...")
puts ("     In the near future, you can be part of multiple groups, each one notifying")
puts ("     you and them of your proximity.")
puts 
puts ("Please enter your membership number:")
current_user_numb = gets.chomp.to_i                 #assumes valid entry of valid id number
current_user_info = db.execute("SELECT name FROM serendipity_members WHERE id=#{current_user_numb} ;")  # returns arr, where [0] is name 
puts
puts ("Welcome back #{current_user_info[0][0]}.")
puts

while true 
  current_user = db.execute("select name, longitude, latitude from serendipity_members where id=#{current_user_numb} ;")  # this gets array of array of name.  name = [["Ted Stamps"]] 
  # puts (member[0][0])
  current_user_name = current_user[0][0]
  current_user_long = current_user[0][1]
  current_user_lat  = current_user[0][2]
  puts ("checking current status since you last ran Serendipity...")
  puts
  member_array = db.execute("SELECT name, longitude, latitude FROM serendipity_members WHERE id != #{current_user_numb};")  
  found = false
  member_array.each do |x| 
    distance = Haversine.distance(x[1], x[2], current_user_long, current_user_lat)   #find distance between other members, and current user.
    if (distance.to_feet < 2000)                                                     #threshold currently 3000 feet.
      puts ("GREAT NEWS , #{x[0]} is less than 2000 feet away!")
      found = true
    end
  end
  if !found
    puts ("Sorry, but there is nobody from Serendipity near you right now.  Try again later.")
  end
  puts
  puts ("(enter  'u' to update your current location,    'q' to quit:)")
  user_choice = gets.chomp
  puts
  if user_choice == 'u'
    update_member_location(db, current_user_numb, rand_long, rand_lat)
  elsif user_choice == 'q'
    puts ("Thanks for using Serendipity 2017")
    break
  end
end 
 
