class Board
  def initialize(secret_word_length)
    @hangman = Array.new(secret_word_length, "_")
    @history_guesses = Array.new()
    @won = false
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
    @history_guesses.push(feedback[:guess])
  end

  def win?(feedback)
    puts 'checking match'
    puts @history_guesses.to_s
    puts feedback[:secret_word]

    if feedback[:secret_word] == @history_guesses.to_s
      puts 'someone has won'
      @won = true
    end
  end
end