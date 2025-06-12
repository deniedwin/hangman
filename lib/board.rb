class Board
  def initialize
    @history = ['']
  end
  # fix this so that it does not keep filling @history with "_" every turn
  def draw_board(secret_word_length)
    @history.fill("_", (0..secret_word_length))
    p @history
  end

  def record_turn(secret_word, feedback)
    puts 'recording turn'
    secret_word.each_char.with_index do |char, index|
      if index == feedback[:positions]
        @history[index] = char
      end
    end
  end
end