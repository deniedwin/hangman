class Game
  def start_game
    puts 'game started'
    setup
    play_rounds
    announce_result
  end

  def setup
    puts 'create player, board, judge'
  end

  def play_rounds
    puts 'play rounds of the game'
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