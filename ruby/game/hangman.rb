=begin
  
pseudocode for guessing game

Class SecretWord
  number of wrong guesses remaining method
  number of unguessed characters method
  secret word (aka puzzle word)
  solved characters so far array
-------------------------------------------------
Get the secret word from the first person.
Convert secret word string into characters.
Create same sized list of underscore characters
Determine the number of wrong guesses allowed based on the size of the word.  (maybe (26/2 - word_size) for example)
While there are still guesses available and the puzzle has unsolved letters
  display underline characters for each unguessed letter, and the correctly guessed letters
  ask the second player if they want to guess another letter
  if they incorrectly guess a letter (and the guess hasn't been done before)
    decrement the remaining wrong guesses
  else confirm there is that letter
Game is over, so deliver message 
  If the puzzle has been solved, give congratulations message.
  If the available guesses are all gone, give taunting message.

=end
class Hangman
  attr_reader   :win , :game_over 
  attr_accessor :guesses, :puzzle, :wrong_letter_bank, :right_letter_bank

  def initialize(secret_word)                     # I could have just passed in the size of the word, perhaps a refactoring candidate
    @guesses = 26/2 - secret_word.chars.length    # initialize to half the alphabet length less the size of the word
    @wrong_letter_bank = []                       # storage location of guessed letters NOT in secret word
    @right_letter_bank = []                       # storage location of guessed letters in secret word
    @puzzle = []                                  # masked word to uncover during game
    secret_word.chars.length.times do             # fill with underscores representing unguessed letters
      @puzzle << "_"
    end
  end

  def display_puzzle                              # shows current state of puzzle in user friendly format
    puts @puzzle.join
  end

  def already_guessed?(letter)
    if @wrong_letter_bank.include?(letter) || @right_letter_bank.include?(letter)     #if letter has already been guessed, set true, otherwise false
      true
    else
      false
    end
  end

  def update(secret_word, letter)                 # should only be called if user guesses a new, correct letter 
    @right_letter_bank << letter                  # update the list of correctly guessed letters
    arry = secret_word.split(//)
    indx = 0
    arry.each do |char|                           # step through array, replacing every instance of the letter in the puzzle array
      if char == letter                              #if current char matches guessed letter,
        @puzzle[indx] = letter                          #then replace underscore in the puzzle with that letter. 
      end
      indx += 1
    end
  end

  def game_over?                      # checks if game is over, and determines if over because of win.
    @game_over = false
    if @guesses <= 0                  #if no guesses left, game is over and didn't win
      @win = false
      true
    elsif @puzzle.include?("_")        #else check if all underscores have been replaced with letters for the win.
      false
    else
      @win = true
      true
    end
  end

end

# User Interface

puts "Player 1, please enter your secret word  (all lowercase)"
secret_word = gets.chomp
puzzle = Hangman.new(secret_word)             #create blank puzzle from the secret word
puts

while !puzzle.game_over?                       #check to see if game is over  (out of guesses or whole word solved)
  puts "Player 2, you have #{puzzle.guesses} guesses remaining."
  puts "Please guess a letter for the following puzzle:"
  puts
  puzzle.display_puzzle    #
  puts 
  next_letter = gets.chomp
  if puzzle.already_guessed?(next_letter)                      # inform user, but no penalty
    puts "you already guessed letter '#{next_letter}'"
    puts "Try again"
    puts
  elsif  secret_word.include?(next_letter)                       # letter is new and in secret_word
    puts "good guess!"
    puzzle.update(secret_word, next_letter)                         # update puzzle with all instances of the correct letter
  else                                                           # must be bad guess
    puzzle.wrong_letter_bank << next_letter                         #place letter in wrong letter array
    puts "wrong guess..."
    puzzle.guesses += -1                                            #decrement guess count
  end
end

if puzzle.win
  puts "Congratulations!  You solved the word!"
  puts secret_word
else
  puts "Ouch!  You are out of guesses.  The word was '#{secret_word}'"
end
