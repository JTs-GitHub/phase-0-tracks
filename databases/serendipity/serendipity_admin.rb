#########################
# THIS RUBY FILE contains the 'admin' code for creating the database, and instantiating it with some fake names and some random locations around the SF area.
# See the 'user' file to see how users can run/update/check proximate notifications. 
#########################


# OPERATION Serendipity
#-----------------------
# Serendipity is a prototype social networking client server technology 
# used to enhance social opportunity based on proximity, without crossing 
# over into stalker mode.
# A core principle of Serendipity is that no user can track the location 
# of another specific user.  The current paradigm is everybody belongs to a 
# group or groups that willingly notify each other if they are proximate to 
# fellow group members.  So you would be notified if somebody in your group
# was at the Giants baseball game with you, or if your friend is dining 
# just 2 blocks away...but without revealing thier actual location.  
# Many alternative groupings are possible, such as family members.  Future 
# iterations might include a 4D logging capability so you can see if you 
# 'just missed' a fellow group member by xx minutes.  The paradigmcould be 
# extended to inanimate objects, such as geo-cashes, that would notify 
# seekers that included geo-cashes are within some threshold distance. 


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

def create_member(db, table, name, longitude, latitude)
  db.execute("INSERT INTO #{table} (name, longitude, latitude) VALUES (?, ?, ?)", [name, longitude, latitude])
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
puts ("      ****************************")
puts ("      *                          *")
puts ("      *    SERENDIPITY 2017      *       Welcome to the 'Serendipity 2017' administrative program.")
puts ("      *                          *")
puts ("      ****************************")
puts
puts
while true
  puts  
  puts ("Please select an administrative function")
  puts ("from the following choices: ")
  puts
  puts (" 'v'   to view existing tables")
  puts (" 't'   to create a new table")
  puts (" 'p'   to populate a table with data")
  puts (" 'q'   to quit")
  puts
  admin_choice = gets.chomp 
  if admin_choice == 'v'
    tables = db.execute "SELECT name FROM sqlite_master WHERE type='table' ORDER BY name;"
    puts ("    The existing tables are;")
    tables.each do |table_name|
        puts ("      #{table_name}")
    end
  elsif admin_choice == 't' 
    puts "name of table to create?"
    new_table_name = gets.chomp
    db.execute(new_table (new_table_name))
    puts "done."
  elsif admin_choice == 'p' 
    puts ("which table do you want to populate?")             # no error checking.  assumption is that valid/existing table will be entered here.
    table_name = gets.chomp
    puts ("how many entries do you want to insert?")
    table_size = gets.chomp.to_i
    table_size.times do
      create_member(db, table_name, Faker::Name.name, -122.397194, 37.784517)   #initialize with fixed location of DBC office
    end
  elsif admin_choice == 'q'
    # puts
    # tables = db.execute(".tables;")
    # p tables 
    # puts ("Thanks for using Serendipity 2017")
    break
  end
end 

