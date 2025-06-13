# board.rb

class Board
  attr_reader :history_guesses

  def initialize(secret_word_length)
    @hangman = Array.new(secret_word_length, '_')
    @history_guesses = Array.new()
  end

  def draw_board
    puts "previous guesses: #{@history_guesses}"
    @hangman.each{|x| print x, ' '}
    puts ''
  end

  def record_turn(secret_word, feedback)
    feedback[:positions].each do |index|
      @hangman[index] = secret_word[index]
    end
    @history_guesses.push(feedback[:guess])
  end

  def win?(feedback)
    won = false
    if feedback[:secret_word] == @hangman.join
      won = true
    end
    won
  end
end