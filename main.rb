# main file of the project hangman
# 
words = File.open("google-10000-english-no-swears.txt") do |file|
  file.read.split
end

puts words.inspect