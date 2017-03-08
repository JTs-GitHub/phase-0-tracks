# RSpec
# 'describe' block for each group of tests  
  # 'it' block for each individual test
    # expect(<YOUR CODE>).to eq <RESULT>

require_relative 'hangman'

describe Hangman do
  let(:puzzle) { Hangman.new("horse") }

  it "creates puzzle array full of 5 underscores" do
    expect(@puzzle).to eq ["_", "_", "_", "_", "_"]
  end

  it "updates the puzzle array, replacing underscores with correctly guessed letter" do
    puzzle.update("horse", "h")
    expect(@puzzle).to eq ["h", "_", "_", "_", "_"]
  end

  it "checks if wrong letter has already been guessed" do
    @wrong_letter_bank = ["x"] 
    puzzle.already_guessed?("x")
    expect(puzzle.already_guessed?).to eq true
  end

  it "checks if player won the game" do
    @guesses = 0 
    puzzle.game_over?
    expect(@win).to eq false
  end
end

  #need to check for upper and lower case

  