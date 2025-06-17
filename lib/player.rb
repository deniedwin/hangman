# frozen_string_literal: true

# player.rb

class Player # rubocop:disable Style/Documentation
  LETTERS = ('a'..'z').to_a

  def get_input(past_guesses) # rubocop:disable Metrics/MethodLength
    puts 'Guess a letter (a-z), 1 to save, 2 to exit:'
    loop do
      input = gets.chomp.downcase
      return :save if input == '1'
      return :exit if input == '2'

      if input.size == 1 && LETTERS.include?(input)
        return input unless past_guesses.include?(input)

        puts 'Already guessed.'

      else
        puts 'Invalid input.'
      end
    end
  end

  def load_or_new
    puts 'Load game or new? [l/n]'
    loop do
      input = gets.chomp.downcase
      return input if %w[l n].include?(input)

      puts 'Invalid choice.'
    end
  end
end
