# judge.rb

class Judge
  def check_guess(guess, secret_word)
    positions = []

    secret_word.each_char.with_index do |char, index|
      if char == guess
        positions.push(index)
      end
    end
    return { guess: guess, positions: positions, secret_word: secret_word }
  end
end
