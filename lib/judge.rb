# judge.rb

class Judge
  def check_guess(guess, secret_word)
    positions = []
    secret_word.each_char.with_index do |char, i|
      positions.push(i) if char == guess
    end
    { guess: guess, positions: positions, secret_word: secret_word }
  end
end
