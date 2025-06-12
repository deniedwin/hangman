class Game
  def start_game
    pre_setup
    play_rounds
    announce_result
  end

  def pre_setup
    @secret_word = choose_code_word
    @player = Player.new
    @board = Board.new(@secret_word.length)
    @judge = Judge.new
    @won = false
    @max_guess_attempts = 3
    puts 'game started'
    puts @secret_word
  end

  def play_rounds
    @max_guess_attempts.times do
      guess = @player.input_guess
      feedback = @judge.check_guess(guess, @secret_word)
      @board.record_turn(@secret_word, feedback) #fix this to include feedback
      @board.draw_board
    end
  end

  def announce_result
    puts 'announce results so far'
  end

  def choose_code_word
    words = File.open('google-10000-english-no-swears.txt', 'r') do |file|
      file.read.split
    end
    filter_words = words.select { |word| word.length >= 5 && word.length <= 12 }
    secret_word = filter_words.sample
    secret_word
  end

end