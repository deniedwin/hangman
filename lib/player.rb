# player.rb

class Player
  LETTERS = ('a'..'z').to_a

  def get_input(past_guesses)
    puts 'Guess a letter (a-z), 1 to save, 2 to exit:'
    loop do
      input = gets.chomp.downcase
      return :save if input == '1'
      return :exit if input == '2'
      if input.size == 1 && LETTERS.include?(input)
        if past_guesses.include?(input)
          puts 'Already guessed.'
        else
          return input
        end
      else
        puts 'Invalid input.'
      end
    end
  end

  def load_or_new
    puts 'Load game or new? [l/n]'
    loop do
      input = gets.chomp.downcase
      return input if input == 'l' || input == 'n'
      puts 'Invalid choice.'
    end
  end
end
