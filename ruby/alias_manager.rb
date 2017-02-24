=begin
pseudocode 
  get_name
  Add name to original list
  add name to fake list
  with fake name
    break_whole_name_to_words
    break_words_to_chars
    convert_vowels
    convert_consonants
    reassemble_words
    reassemble_whole_name
    print real and fake name
print out all name pairs
=end

#DEFINE METHODS

def get_name_or_quit
  user_input = ""
  puts "Enter a real name, 'quit' to exit."
  user_input = gets.chomp
 end

def add_name(array_of_names, new_name)
  array_of_names.push(new_name)                   #add new_name to existing array of names.
end


#DEFINE AND INITIALIZE VARIABLES
vowels = "aeiou".chars                                 #easy way to make array of vowels
consonants = "bcdfghjklmnpqrstvwxyz".chars             #easy way to make array of consonants

real_names = []       #growing array of the real, whole names (first and last) with space between
fake_names = []       #growing array of fake names indexed to match the real names 
whole_name = ""       # string of current working name with space between first and last
reverse_name_array = []  #temporary array holding place for reversing first and last names
name_as_letters = []  #array of individual letters for fake name, includes space separator



#DRIVER CODES
whole_name = get_name_or_quit                          #initial getting of name and or quit.
while whole_name != "quit"                             #loop until user enters "quit"
  add_name(real_names, whole_name)                     #add the real name to existing arrays.  code will modify real name in fake_names
  reverse_name_array = whole_name.split(" ").reverse   #split first and last name, then reverse order as two strings into reverse_name_array
  whole_name = reverse_name_array.join(" ")            #first and last name have exchanged places with space between.
  name_as_letters = whole_name.chars                   #convert name into an array of letters
  
  name_as_letters.map! do |letter|                      #for each letter, dangerously do
    if letter != letter.downcase                        #check for capitalization
      capital = true
    else
      capital = false
    end
    letter = letter.downcase                            #downcase all letters
    if vowels.index(letter) != nil                      # check if current letter is in vowels array
      letter = vowels[vowels.index(letter) -4]          # change letter to next vowel
    elsif consonants.index(letter) != nil               # check if current letter is in consonants array
      letter = consonants[consonants.index(letter) -20] # change letter to next consonant
    end
    if capital                                           #if was originally capitalized
      letter = letter.upcase                             #return it to capital version of letter
    end
    letter
  end

  add_name(fake_names, name_as_letters.join(''))          #join letters back into single string, then add string to fake_names array
  puts "#{real_names.last} has a fake name of '#{fake_names.last}'"    #give user feedback about the before/after
  puts
  whole_name = get_name_or_quit                            #see if user wants to enter a new name or quit.
end

2.times {puts}                                                         # output spacing
puts  "Here is the full list of names and their fake name aliases"
puts
real_names.each do |name|                                               #for each real name...
  indx = real_names.index(name)                                           #find it's index number
  puts "'#{name}' has been encrypted to '#{fake_names[indx]}'"            # then print out the real name and the fake name using the same index
end

