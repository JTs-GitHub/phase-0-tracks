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
