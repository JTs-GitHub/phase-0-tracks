# OPERATION Serendipity

#########################
# THIS RUBY FILE contains code for creating the database, and instantiating it with some fake names and some random locations around the SF area. 
#########################


# require gems
require 'sqlite3'
require 'faker'
#require 'haversine'

 

# create SQLite3 database
db = SQLite3::Database.new("serendipity.db")
# db.results_as_hash = true    # kept around for reference if I want to turn table into a hash

# fancy string delimiters
create_table_cmd = <<-SQL
  CREATE TABLE IF NOT EXISTS serendipity_members(
    id INTEGER PRIMARY KEY,
    name VARCHAR(255),
    longitude REAL,
    latitude  REAL
  )
SQL
#db = SQLite3::Database.open('sreendipity.db')



# add member to database.
def create_member(db, name, longitude, latitude)
  db.execute("INSERT INTO serendipity_members (name, longitude, latitude) VALUES (?, ?, ?)", [name, longitude, latitude])
end


# DRIVER CODE *************************************************************************************

# create a membership table (if it's not there already)
db.execute(create_table_cmd)

#seed db list with unique-ish names and identical locations
100.times do
  create_member(db, Faker::Name.name, -122.397194, 37.784517)   #initialize with fixed location of DBC office       
end


#distance = Haversine.distance(locations[0][1], locations[0][2], locations[1][1], locations[1][2])
#puts distance.to_miles
3.times do
  
  locations = db.execute("select name, longitude, latitude from serendipity_members ;")
  locations.each do |member| 
    distance = Haversine.distance(locations[0][1], locations[0][2], member[1], member[2])
    if distance.to_feet < 3000 
      puts ("GREAT NEWS, #{member[0]} is less than 3000 feet away!")
    end
  #  puts ("distance to #{member[0]} is #{distance.to_miles} miles.")
  end
end


#----------------------------------------------------------
# explore ORM by retrieving data
# kittens = db.execute("SELECT * FROM kittens")
# kittens.each do |kitten|
#  puts "#{kitten['name']} is #{kitten['age']}"
# end

