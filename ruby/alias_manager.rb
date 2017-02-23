=begin 

psuedocode for release 0 of 5.5 solo challenge

0.  -get "Felicia Torres"
1.  -Swap first and last name
    -for each name  
      -convert into array of char
2.    -Change all the letters into the next vowel or next consonant 
        -create an array of vowels (lower case)
        -create an array of consonants (lower case)
        -iterate through the array of letters representing the name
          -check for upper case.  if yes, convert to lower case, and set a flag for later upcasing
          -if in the vowel array, change the name letter to next indexed vowel. (remember to start at -5)
          -if in the consonant array, change to next indexed consonant.  (remember to start at -21)
          -if necessary, upcase the transformed letter.
      -join the letters back into a single name string

=end

#name = "Felicia Torres"
loop do                                                       #allow users to enter multiple names to encrypt, 
  puts "Please enter a name to encrypt ('quit' to exit)"
  name = gets.chomp
  if name == "quit"  || name == "exit"                    
    break                               # exit
  else
    names_array = name.split(' ')       #split names into array of first and last strings
    #p names_array                       #debug print
    names_array = names_array.reverse   #reverse the order of the strings in the array.  may only work for 2 names.

    vowels = ["a", "e", "i", "o", "u"]
    consonants = "bcdfghjklmnpqrstvwxyz".chars

    fake_name = names_array.map do |name|   #for each name in the name_array, change the letters and then write fake names into new array 
      name_as_letter_array = name.chars     #create array of letters from each name
      name_as_letter_array.map! do |letter|           #iterate through array one letter at a time
        if letter != letter.downcase                  #(check if capital, and set boolean
          is_cap = true
          letter = letter.downcase
        else
          is_cap = false
        end                  
        vowels_index = vowels.index(letter)  #check if current letter is in the vowels array, and if so return its index number, else nil
        if vowels_index != nil                        # if not nil, then overwrite current letter with next vowel in vowels array
          letter = vowels[vowels_index - 4]           #step backwards in array 4 places to get next array item, so that indexing past "u" does not cause error.  
        else                                          # is a consonant (no error checking here.  original name must be letters or space, and probably on 2 names)
          consonants_index = consonants.index(letter)
          letter = consonants[consonants_index - 20]  #back up index so we don't accidentally increment past z
        end
        if is_cap
          letter = letter.upcase
        else
          letter
        end
      end
      name = name_as_letter_array.join
    end
  end
  puts "your new fake name is,  #{fake_name}"
  puts
  fake_name
end


