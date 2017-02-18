=begin 

    Pseudocode of encryption program
    --------------------------------

    ENCRYPT psydocode:

      -pass a string into an "encrypt" method
      -ENCRYPT method:
        -create a new empty string  
        -for each letter in the string, find its corresponding index in the alphabet
        -find the next letter in the alphabet and write that letter into the new string
        -repeat until all the letters have been converted into a new string
        -print the new string and return


    DECRYPT pseudocode:

      -pass a string into a "decrypt" method
      -DECRYPT method:
        -create a new empty string  
        -for each letter in the string, find its corresponding index in the alphabet
        -subtract the alphabet index by 1, and write that letter into the new string
        -repeat until all the letters have been converted into a new string
        -print the new string
    =end


    =begin 
      rewriting methods to return strings.  previously, I was printing encrypt/decrypt strings on the fly,
      and not returning a different string.  Now, the methods can be nested  as in "puts decrypt(encrypt("swordfish")).
      In that example, "swordfish" encryption returns the encrypted string, which is then able to be the input to the 
      decrypt method. 

=end 


=begin
  
  #ARCHIVING this release 4 code because release 5 asks for different UI and output.  I want to reuse one method
  instead of having 2 methods that only differ in the direction they shift the letters, The new method will 
  additionally be ready to utilize variable encryption/decryption magnitudes.

    def encrypt(string_to_encrypt)
      alphabet = "abcdefghijklmnopqrstuvwxyz"
      offset = 0
      newstring = ""   #create new string for explicit return
      #find index of the letter in the string alphabet
      while offset < string_to_encrypt.length
        alphabet_index = alphabet.index(string_to_encrypt[offset])
        if alphabet_index == 25
          alphabet_index = -1
        end
        # print alphabet[alphabet_index + 1]
         newstring[offset] = alphabet[alphabet_index + 1]
        offset += 1
      end
    return newstring   #using explicit return, and full new string to allow nested call
    print newstring
    end



    def decrypt(string_to_decrypt)
      alphabet = "abcdefghijklmnopqrstuvwxyz"
      offset = 0
      newstring = ""    #creating new string for explicit return value
      #find index of the letter in the string alphabet
      while offset < string_to_decrypt.length
        alphabet_index = alphabet.index(string_to_decrypt[offset])
        #print alphabet[alphabet_index - 1]
        newstring[offset] = alphabet[alphabet_index - 1]
        offset += 1
      end
    #puts "#{string_to_decrypt} is now decrypted to #{newstring}"
    return newstring
    print newstring
    end

    puts encrypt("abc")
    puts encrypt("zed")
    puts decrypt("bcd")
    puts decrypt("afe")

    puts decrypt(encrypt("swordfish"))
=end


#shift_amount = 0  #same method can be used to encrypt or decrypt by changing this value/direction.

# OUR METHOD DECLARATIONS

# translates password string based on user choice to encrypt or decrypt,by amount and direction vector
def translate(password, vector)
  alphabet = "abcdefghijklmnopqrstuvwxyz"
  newstring = ""

  #to keep indexes from going past "z", add a shift of -26 when going forward, keep at 0 when going backwards.
  if vector == 1      
    shift = -26     #if encrypting forward, then back up the indexing 26 spaces so we can't increment past "z"
  else
    shift = 0       #if we're decrypting backwards, no need to worry about going past "z"
  end
  
  #find the alphabet index for each password letter, then write the new letter in newstring.
  offset = 0
  while offset < password.length
    if password[offset] == " "          #leave blanks unchanged in newstring
      newstring[offset] = " "
    else
      alphabet_index = alphabet.index(password[offset]) + shift  #move initial offset left 26 places if encrypting, 0 if decrypting.
      newstring[offset] = alphabet[alphabet_index + vector]
    end
    offset += 1
  end
  return newstring
end



# OUR DRIVER CODE

puts "Welcome to the Secret Agent Encryption/Decryption program."
valid_input = false;

# keep asking for input until user chooses "encrypt" or "decrypt"
while !valid_input
  puts "Would you prefer to 'encrypt' or 'decrypt' a password?"
  encrypt_decrypt_string = gets.chomp
  if encrypt_decrypt_string == "encrypt"
    valid_input = true
    shift_magnitude = 1
  elsif encrypt_decrypt_string == "decrypt"
    valid_input = true
    shift_magnitude = -1
  end
end
puts "Please enter the password to #{encrypt_decrypt_string} "
secret_password = gets.chomp
puts ""
print "'#{secret_password}' is now '"
print translate(secret_password, shift_magnitude)
puts "'"
