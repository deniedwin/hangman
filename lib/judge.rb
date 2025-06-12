class Judge
  def check_guess(guess, secret_word)
    positions = []
    found = false

    secret_word.each_char.with_index do |char, index|
      if char == guess
        found = true
        puts "char: #{char}, index: #{index}"
        positions.push(index)
      end
    end
    feedback = { found: found, positions: positions }
  end
end
