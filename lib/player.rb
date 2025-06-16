# player.rb

class Player

  VALID_INPUTS = %w[a b c d e f g h i j k l m n o p q r s t u v w x y z].freeze

  def input_guess(previous_guesses)
    puts 'enter guess letter: a - z'
    loop do
      guess = gets.downcase.chomp
      if !valid_input?(guess)
        puts 'invalid input'
      elsif previous_guesses.include?(guess)
        puts 'already used this guess, try again'
      else
        return guess
      end
    end
  end
  
  def valid_input?(guess)
    guess.size == 1 && VALID_INPUTS.include?(guess)
  end

  def valid_command?(load)
    load == 'l' || load == 'n'
  end

  def valid_save?(save)
    save == 'y' || save == 'n'
  end

  def load_or_new
    puts 'load or new game? [l/n]'
    loop do
      load = gets.downcase.chomp
      if !valid_command?(load)
        puts 'invalid input'
      elsif load == 'l'
        puts 'load game'
        return 'l'
      elsif load == 'n'
        puts 'new game'
        return 'n'
      end
    end
  end
  
  def save_game
    puts 'want to save the game? [y/n]'
    loop do
      save = gets.downcase.chomp
      if !valid_save?(save)
        puts 'invalid input'
      elsif save == 'y'
        State.save(game)    # save game state here
        puts 'game saved'
        return 'y'
      elsif save == 'n'
        puts 'continue'
        return 'n'
      end
    end
  end

end