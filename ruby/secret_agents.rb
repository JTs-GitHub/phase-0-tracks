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

alphabet_index = alphabet.index(string_to_decrypt[offset])

=end


def encrypt(string_to_encrypt)
  alphabet = "abcdefghijklmnopqrstuvwxyz"
  index = 0
  print "#{string_to_encrypt} becomes "
  while index < string_to_encrypt.length
    print alphabet[string_to_encrypt[index].next]
    index += 1
  end
  puts ""
end


def decrypt(string_to_decrypt)
  alphabet = "abcdefghijklmnopqrstuvwxyz"
  index = 0
  alphabet_index = 0
  print "#{string_to_decrypt} becomes "
  while index < string_to_decrypt.length
    alphabet_index = alphabet.index(string_to_decrypt[index])
    print alphabet[alphabet_index -1]
    index += 1
  end
  puts ""
end


