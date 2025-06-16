# board.rb

class Board
  attr_reader :history_guesses

  def initialize(secret_word_length)
    @hangman = Array.new(secret_word_length, '_')
    @history_guesses = []
  end

  def draw
    puts "Word: #{@hangman.join(' ')}"
    puts "Guesses: #{@history_guesses.join(', ')}"
  end

  def record(secret_word, feedback)
    feedback[:positions].each do |index|
      @hangman[index] = secret_word[index]
    end
    @history_guesses.push(feedback[:guess])
  end

  def win?(feedback)
    @hangman.join == feedback[:secret_word]
  end
end

