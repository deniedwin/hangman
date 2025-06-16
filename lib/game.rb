# game.rb

class Game
  def start_game
    setup
    play
    result
    restart
  end

  def setup
    @secret_word = pick_word
    @player = Player.new
    @board = Board.new(@secret_word.length)
    @judge = Judge.new
    @tries_left = @secret_word.length + 1
    @won = false
    # puts "secret word: #{@secret_word}"
  end

  def play

    puts "secret word: #{@secret_word}"
    @board.draw

    while @tries_left > 0
      puts "tries left: #{@tries_left}"
      guess = @player.get_input(@board.history_guesses)

      if guess == :save
        State.save(self)
        puts "game saved"
        next
      end

      if guess == :exit
        puts "exit game"
        exit
      end

      feedback = @judge.check_guess(guess, @secret_word)
      @board.record(@secret_word, feedback)
      @board.draw

      if @board.win?(feedback)
        @won = true
        break
      end

      @tries_left -= 1
    end
  end

  def result
    if @won
      puts "you won!"
    else
      puts "you lost!"
      puts "word was: #{@secret_word}"
    end
  end

  def restart
    puts "new game? (y/n)"
    input = gets.chomp.downcase
    if input == "y"
      Game.new.start_game
    else
      puts "bye"
      exit
    end
  end

  def pick_word
    file = File.open("google-10000-english-no-swears.txt", "r")
    words = file.read.split
    list = words.select { |w| w.length >= 5 && w.length <= 6 }
    list.sample
  end
end
