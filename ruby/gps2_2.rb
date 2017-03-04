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
def add_item(list, item_name, quantiy=1)
  list[item_name] = quantiy
end
# output: hash with new item 

# Method to remove an item from the list
# input:
# steps:
# output:

# Method to update the quantity of an item
# input:
# steps:
# output:

# Method to print a list and make it look pretty
# input:
# steps:
# output:

#DRIVER CODE
shopping_list = create_list("carrots apples cereal pizza")
add_item(shopping_list, "bread", 2)
p shopping_list