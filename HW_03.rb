###############################################################################
#
# Introduction to Ruby on Rails
#
# Homework 03
#
# Purpose:
#
# Read the links below and complete the exercises in this file. This Lab
# is to help you better understand Arrays, Hashes and Loops that we
# learned in Lesson 03.
#
###############################################################################
#
# 1. Review your solution to Lab 02. Copy and Paste your solution to
#    this file.
#
# 2. Create a new Array variable called `set_of_numbers`, this will be
#    a range between 1 - 10 that our Player will guess from. Each value
#    in the Array should be an integer.
#
# 3. Change the variable `secret_number` (HW_02) so that instead of a hard-coded
#    Integer, it randomly chooses one of the options from `set_of_numbers`
#    ('secret_number' is the integer our Player will try to guess).
#
#      Hint: Look up Array#sample in the Ruby documentation.
#
# 4. Create a new Hash variable called `messages`. In this Hash will be
#    four Keys Value pairs:
#
#    1. :win - A String telling the Player that they have won.
#
#    2. :lose - A String telling the Player that they have lost and what
#       the correct number was.
#
#    3. :too_low - A String telling the Player that their guess was too
#       low.
#
#    4. :too_high - A String telling the Player that their guess was too
#       high.
#
# 5. Change the behavior of your program, so instead of hard coding, use the principles of DRY(don't repeat yourself). 
#    This means using a Loop to iterate over your code either until the Player has guessed the
#    correct number, or they have tried to guess 3 times.
#
# 6. Make sure to comment your code so that you have appropriate
#    documentation for you and for the TAs grading your homework. :-)
#
###############################################################################
#
#Put your solution below this line.
#
###############################################################################

#Array for a random number 1-10
set_of_numbers = [1,2,3,4,5,6,7,8,9,10]

#The secret number var is randomly assigned a value from the array 'set_of_numbers'
secret_number = set_of_numbers.sample

#Hash and key values to inform the user about their guess
messages = Hash.new

messages[:win] = "Congratulations, You guessed correctly!"
messages[:lose] = "Sorry to inform you, but you lost, the secret number is #{secret_number}."
messages[:too_high] = "Just a little lower now..."
messages[:too_low] = "Why not try a bit higher?"


#Initial greeting
puts "Hello friend, and welcome.  I am the Creator."
puts "What is your name friend?"

#User name stored in var
player_name = gets.chomp

#Explanation of the rules
puts "Hi, " + player_name + ".  You will now have 3 chances to correctly guess my secret number between 1 and 10."
guesses_left = 3

#Until loop checking how many guesses the user has left
until guesses_left < 0
    
#Declares numbe of guesses left, and prompts user to enter guess then removes one guess from guesses_left
    puts "You have " + guesses_left.to_s + " guesses left."
    puts "Make your guess.  Choose wisely now."
    guesses_left = guesses_left-1
    player_guess = gets.to_i
    
#Checks if player has lost or won, otherwise gives gives hint for next guess 
    if player_guess != secret_number && guesses_left == 0
        puts messages[:lose]
        break
    elsif
        player_guess == secret_number.to_i
        puts messages[:win]
        break
    elsif player_guess > secret_number.to_i
        puts messages[:too_high]
    elsif player_guess < secret_number.to_i
        puts messages[:too_low]
    end

end
    

