class Judge

  def check_guess(guess, secret_word)
    @positions = []
    secret_word.each_char.with_index do |char, index|
      if char == guess
        puts "char: #{char}, index: #{index}"
        @positions.push(index)
      end
    end
  end
end