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
  arry = starting_list.split(" ")
  arry.each { |item_name| shopping_list[item_name] = 1}
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

=begin
RELEASE 4: REFLECT section.
What did you learn about pseudocode from working on this challenge?
    -pseudocode can save you a lot of time when it comes time to code, but only if you fully 
     understand the nature of how the code will be used. 

What are the tradeoffs of using arrays and hashes for this challenge?
    -array's are simpler, with more easily understandable read/write access methods, 
     but hashes are better when dealing with unique items that can be labels. 

What does a method return?
    -implicitly, it returns the last evaluated expression.  explicitly, it can return 
     just about anything you want it to return. 

What kind of things can you pass into methods as arguments?
    -pretty much anything, including arrays, strings, hashes, integers, and other methods.

How can you pass information between methods?
    -well, there are a variety of ways.  For passing in, you can use arguments to pass information in, or blocks. 
     You can also use objects that have a wider scope (like global variables) or objects/variables that reside outside the methods.

What concepts were solidified in this challenge, and what concepts are still confusing? 
    -first and foremost for me, I find the requirements extremely vague, which causes a drag on everything after.
     For example, when we're supposed to create a method that creates a new list, that is so vague as to be debilitating.  It bothers 
     me that the first couple tries I attempted were shut down by the guide because they created a new list but not the way 
     that was apparently envisioned by the assignment.   So where the assignment said to write "a separate method for [create a new list]", what 
     it really wanted was "create a method that takes a single string of shopping items separated by a space, and turn that string into a shopping
     list of items with a quantity associated with each item, in either a hash or an array."  To me, those are quite different assignments that result in a drastically different
     vision of the potential code.  So if one objective is to viscerally feel the importance of fully understanding the requirments even before
     you pseudocode, then mission accomplished.
    -second, from my partner, i learned that assigning a value to a hash key will create a new key/value pair even if the label didn't exist before
     (for example, h.[item] = 3 will create a new key if it didn't exist before, and update the value of the key if it already exists.  freaky)   
 
end