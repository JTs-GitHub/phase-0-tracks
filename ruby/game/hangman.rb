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
  attr_reader   :win , :wrong_letter_bank
  attr_accessor :guesses, :game_over , :puzzle

  def initialize(secret_word)
    @guesses = 26/2 - secret_word.chars.length
    @wrong_letter_bank = []                # storage location of guessed letters not in secret word
    @puzzle = []                           # masked word to uncover during game
    secret_word.chars.length.times do
      @puzzle << "_"
    end 
  end

  def display_puzzle
    puts @puzzle.join
  end

  def guesses_remaining
  end

  def already_guessed?(letter)
    if @wrong_letter_bank.include(letter) #if letter has already been guessed, set true, otherwise false
      true
    else
      false
    end

  def letter_in_word
    # if letter is in secret word, return true
  end

  def update(letter)
    @puzzle# replace underscore with letter 
  end

  def game_over?
    @game_over = false
    if @guesses <= 0
      @win = false
      true
    elsif @puzzle.include("_")
      false
      end
  end
end



# DRIVER CODE
puts "Player 1, please enter your secret word"
secret_word = gets.chomp
puzzle = Hangman.new(secret_word)             #create blank puzzle from the secret word
puts puzzle 
while !puzzle.game_over?                       #check to see if game is over  (out of guesses or whole word solved)
  puts "Player 2, you have #{puzzle.guesses} guesses remaining."
  puts "Please guess a letter for the following puzzle:"
  puts
  puzzle.display_puzzle    #
  puts 
  next_letter = gets.chomp
  #if puzzle.already_guessed?(next_letter)
  if puzzle.wrong_letter_bank.include(next_letter)              #assumes letter is either 1) already guessed   2) in secret word   3)a newly guessed wrong letter
    puts "you already guessed letter '#{next_letter}'"
  elsif  secret_word.include(next_letter)                       # letter_in_secret_word
    puzzle[secret_word.index(next_letter)] = next_letter        #place letter puzzle at proper point
  else
    wrong_letter_bank << next_letter                            #place letter in wrong letter array
    puzzle.guesses -= 1                                         #decrement guess count
  end
  
  break
end
  
