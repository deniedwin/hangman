# main file of the project hangman
# 
# words = File.open("google-10000-english-no-swears.txt") do |file|
#   file.read.split
# end

# puts words.inspect

# requiered files inside lib folder for app to run correctly
require_relative 'lib/game'
require_relative 'lib/gameio'
require_relative 'lib/state'

# class that runs the game
class GameRunner
  def self.run
    hangman = Game.new
    hangman.start_game
  end
end

GameRunner.run