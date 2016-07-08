count = 0
loop do
  puts "count up! #{count}"
  count += 1
  break if count > 5
  puts "do you want to play again?"
  answer = gets.chomp
  puts "your answer is #{answer}."
end
