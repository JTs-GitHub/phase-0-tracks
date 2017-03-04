#GPS 2.2 preparation file.

#pseudocode
# Method to create a list
# input: string of items separated by spaces (example: "carrots apples cereal pizza")
# steps: 
  #  Create Empty List
  #  Parse initial list into individual items
  #  set default quantity to 1
  #  FOR every item do the following
      #  turn item into a label
      #  add its default quantity
  # print the list to the console [can you use one of your other methods here?]
# output: [hash]

def create_list(starting_list)
  shopping_list = {}
  arry = starting_list.split(' ')
  arry.each { |i| shopping_list[i.to_s] = 1}
  return shopping_list
end


# Method to add an item to a list
# input: list, item name, and optional quantity
# steps:
# Ask for input of item # 
def add_item(list, item_name, quantity=1)
  list[item_name] = quantity
end
# output: hash with new item 

# Method to remove an item from the list
# input: hash and key of item to remove
# steps:
def remove_item(list, item_name)
  list.delete(item_name)
end
# output: updated hash 

# Method to update the quantity of an item
# input: list hash, item_name, integer representing new quantity
# steps:
def update_quantity(list, item_name, new_quantity)
  list[item_name] = new_quantity
end
# output:

# Method to print a list and make it look pretty
# input: list hash
# steps:
def print_friendly_list(list)
  puts 
  puts "Shopping List:"
  puts "----------------"
  list.each {|key, value| puts "#{key} #{value}" }
  puts 
end
# output: nil

#DRIVER CODE
shopping_list = create_list("carrots apples cereal pizza")
add_item(shopping_list, "Lemonade", 2)
add_item(shopping_list, "Tomatoes", 3)
add_item(shopping_list, "Onions", 1)
add_item(shopping_list, "Ice Cream", 4)
remove_item(shopping_list, "Lemonade")
update_quantity(shopping_list, "Ice Cream", 1)
print_friendly_list(shopping_list)

