# OPERATION Serendipity
# Serendipity is a prototype social networking client server technology used to enhance social opportunity, without crossing over into stalker mode.
# A core principle of Serendipity is that no user can track the location of another specific user.  The current paradigm is everybody belongs to a 
# group or groups that willingly notify each other if they are proximate to fellow group members.  So you would be notified if somebody in your group
# was at the Giants baseball game with you, or if your friend is dining just 2 blocks away...  Many alternative groupings are possible, such as family
# members.  Future iterations might include a 4D logging capability so you can see if you 'just missed' a fellow group member by xx minutes.  The paradigm
# could be extended to inanimate objects, such as geo-cashes, that would notify seekers that included geo-cashes are within some threshold distance. 

#########################
# THIS RUBY FILE contains the 'admin' code for creating the database, and instantiating it with some fake names and some random locations around the SF area. 
#########################


# REQUIRED GEMS 
require 'sqlite3'
require 'faker'


def new_table (table_name)
  new_table_str = "CREATE TABLE IF NOT EXISTS " 
  new_table_str += table_name + "("
  new_table_str << <<-SQL

    id INTEGER PRIMARY KEY,
    name VARCHAR(255),
    longitude REAL,
    latitude  REAL
  )
SQL
#  puts ("full string is #{new_table_str}")
  new_table_str
end

def create_member(db, name, longitude, latitude)
  db.execute("INSERT INTO serendipity_members (name, longitude, latitude) VALUES (?, ?, ?)", [name, longitude, latitude])
end


# DRIVER CODE *************************************************************************************

# file must be created and/or opened in order for administration functions to be performed.
if File.exist?("serendipity.db")
  db = SQLite3::Database.open("serendipity.db")
else
  db = SQLite3::Database.new("serendipity.db")
end

# simplest db includes at least the core serendipity_members table, so create at startup.
db.execute(new_table ("serendipity_members"))   
puts ("****************************")
puts ("*                          *")
puts ("*    SERENDIPITY 2017      *")
puts ("*                          *")
puts ("****************************")
puts
puts
puts ("Welcome to 'Serendipity 2017'  administrative program.")
puts
while true
  puts  
  puts ("Please select an administrative function")
  puts ("from the following choices: ")
  puts
  puts (" 't'   to create a new table")
  puts (" 'p'   to populate a table with data")
  puts (" 'q'   to quit")
  puts
  admin_choice = gets.chomp 
  if admin_choice == 't' 
    puts "name of table to create?"
    new_table_name = gets.chomp
    db.execute(new_table (new_table_name))
    puts "done."
  elsif admin_choice == 'p' 
    puts ("which table do you want to pupulate?")             # no error checking.  assumption is that valid/existing table will be entered here.
    table_name = gets.chomp
    puts ("how many entries do you want to insert?")
    table_size = gets.chomp.to_i 
  elsif admin_choice == 'q'
    puts
    puts ("Thanks for using Serendipity 2017")
    break
  end
end 



# create a membership table (if it's not there already)
# puts ("about to create new table")
# db.execute(create_table_cmd)  #currently, this creates 1 and only 1 table of fixed name.  Later, add admin defined new table names.
# puts ("done creating new table")


#seed db list with unique-ish names and identical locations
# 100.times do
#   create_member(db, Faker::Name.name, -122.397194, 37.784517)   #initialize with fixed location of DBC office       
# end

