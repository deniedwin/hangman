# game.rb

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
    @max_guess_attempts = @secret_word.length+1
    @won = false
    puts 'game started'
    puts "secret word: #{@secret_word}"
  end

  def play_rounds
    @max_guess_attempts.times do
      guess = @player.input_guess(@board.history_guesses)
      feedback = @judge.check_guess(guess, @secret_word)
      @board.record_turn(@secret_word, feedback)
      @board.draw_board
      @player.save_game(self)
      puts ''

      if @board.win?(feedback)
        @won = true
        break
      end
    end
  end

  def announce_result
    if @won
      puts 'player won'
    else
      puts 'player lost'
    end
  end

  def choose_code_word
    words = File.open('google-10000-english-no-swears.txt', 'r') do |file|
      file.read.split
    end
    filtered_words = words.select { |word| word.length >= 5 && word.length <= 6 }
    secret_word = filtered_words.sample
    secret_word
  end

end