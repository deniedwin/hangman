class Game
  def start_game
    puts "game started"
    select_secret_word
  end

  def select_secret_word
    words = File.open('google-10000-english-no-swears.txt', 'r') do |file|
      file.read.split
    end
    filter_words = words.select { |word| word.length >= 5 && word.length <= 12 }
    secret_word = filter_words.sample
    secret_word
  end
end