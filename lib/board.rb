class Board
  def initialize(secret_word_length)
    @hangman = Array.new(secret_word_length, "_")
    @history_guesses = Array.new()
  end

  def draw_board
    puts "guesses: #{@history_guesses}"
    @hangman.each{|x| print x, ' '}
    puts ''
  end

  def record_turn(secret_word, feedback)
    feedback[:positions].each do |index|
      @hangman[index] = secret_word[index]
    end
    @history_guesses.push(feedback[:found])
  end
end