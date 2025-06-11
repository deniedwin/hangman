class Player
  # FIX THIS!
  VALID_INPUTS = %w[a b c d e f g h i j k l m n o p q r s t u v w x y z].freeze

  def make_guess
    puts 'enter letter from a to z'
    loop do
      guess = gets.chomp
      return guess if valid_input?(guess)
      puts 'invalid code'
    end
  end

  def valid_input?(guess)
    guess.size == 1 && guess.all? { |letter| VALID_INPUTS.include?(letter) }
  end
end