class Player

  VALID_INPUTS = %w[a b c d e f g h i j k l m n o p q r s t u v w x y z].freeze

  def input_guess
    puts 'enter guess letter: a - z'
    loop do
      @guess = gets.downcase.chomp
      return @guess if valid_input?(@guess)
      puts 'invalid code'
    end
  end

  def valid_input?(guess)
    guess.size == 1 && VALID_INPUTS.include?(guess)
  end

end