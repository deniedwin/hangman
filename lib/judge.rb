class Judge
  def check_guess(guess, secret_word)
    positions = []

    secret_word.each_char.with_index do |char, index|
      if char == guess
        positions.push(index)
      end
    end
    feedback = { found: guess, positions: positions }
  end
end
