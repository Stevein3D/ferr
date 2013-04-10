###############################################################################
#
# Introduction to Ruby on Rails
#
# Lab 04
#
# Purpose:
#
# Read the steps below and complete the exercises in this file. This Lab
# will help you to review the basics of Object-Oriented Programming that
# we learned in Lesson 04.
#
###############################################################################
#
# 1. Review your solution to Lab 03. Copy and Paste your solution to
#    this file.
#
# 2. Create a new method called `increment_guess_count` that takes
#    an integer parameter and increments it by 1.
#
# 3. Create a new method called `guesses_left` that calculates how many guesses 
#	 out of 3 the Player has left. The method should take one parameter that is the 
#	 number of guesses the player has guessed so far. Use this new method in your 
#	 code to tell the user how many guesses they have remaining. 
#
# 4. Make sure to remove your local variable `guesses_left` and use the
#    new method instead.
#
# 5. Make sure to comment your code so that you have appropriate
#    documentation for you and for the TAs grading your homework. :-)
#
###############################################################################
#
# Student's Solution
#
##############################################################################

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
guesses = 3

#Decreases the guess count by 1 each time its called
def decrement_guess_count(guesses)
    guesses -= 1
end

#Prints to the user how many guesses he/she has left.
def guesses_left(x)
    puts "You now have #{x} guesses left."
end

#Until loop checking how many guesses the user has left
until guesses == 0

    #Declares numbe of guesses left, and prompts user to enter guess then removes one guess from guesses_left
    guesses_left(guesses)
    puts "Make your guess.  Choose wisely now."
    guesses = decrement_guess_count(guesses)
    #Gets the users input and assigns the value to a variable
    player_guess = gets.to_i
    
    #Checks if player has lost or won, otherwise gives gives hint for next guess
    if player_guess != secret_number && guesses == 0
        puts messages[:lose]
        break
    elsif player_guess == secret_number.to_i
        puts messages[:win]
        break
    elsif player_guess > secret_number.to_i
        puts messages[:too_high]
        decrement_guess_count(guesses)
    elsif player_guess < secret_number.to_i
        puts messages[:too_low]
        decrement_guess_count(guesses)
    end
    
end
