class Judge
  def check_guess(guess, secret_word)
    positions = []
    found_char = ''

    secret_word.each_char.with_index do |char, index|
      if char == guess
        found_char = char
        puts "char: #{char}, index: #{index}"
        positions.push(index)
      end
    end
    feedback = { found: guess, positions: positions }
  end
end
