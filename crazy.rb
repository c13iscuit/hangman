#!/usr/bin/env ruby

GUESSES = 8
remaining_guesses = GUESSES

word_bank = ["hello", "goodbye", "bananas", "apples", "billboard", "puppies", "batman", "carpet"]
hidden_word = word_bank.sample
# puts hidden_word

hidden_array = Array.new(hidden_word.length, '_')

while remaining_guesses > 0
  puts "Word: #{hidden_array.join('')}"
  puts "Guesses remaining: #{remaining_guesses}"
  print "Enter your guess: "
  guess = gets.downcase.chomp
  guess_char_num = guess.length

  if guess_char_num > 1
    if guess == hidden_word
      puts "You guessed #{hidden_word.upcase} coorectly!"
      remaining_guesses = 0
    else
      puts "You chose poorly..."
      remaining_guesses = 0
    end
  elsif guess_char_num == 0
    puts "Please enter a valid guess: letters 'a-z' or a single word"
  else
    if hidden_word.include?("#{guess}") == false
      puts "Sorry, the word does not contain that letter."
      remaining_guesses -= 1
      puts "Out of guesses! You lose!" if (remaining_guesses == 0)
    else
      position_one = hidden_word.index("#{guess}")
      hidden_array[position_one] = "#{guess}"
      if hidden_array.join == hidden_word
        puts "You guessed all the letters in #{hidden_word.upcase}. You win!"
        remaining_guesses = 0
      else
      end
      if hidden_word.count("#{guess}") > 1
        counter = 1
        while counter < hidden_word.count("#{guess}")
          position_one = hidden_word.index("#{guess}", position_one + 1)
          hidden_array[position_one] = "#{guess}"
          counter += 1
        end
        if hidden_array.join == hidden_word
          puts "You guessed all the letters in #{hidden_word.upcase}. You win!"
          remaining_guesses = 0
        else
        end
      else
      end
    end
  end
end
