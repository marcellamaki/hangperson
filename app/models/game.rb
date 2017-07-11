require 'pry'

class Game

  attr_accessor :user, :strikes, :bad_guesses, :good_guesses, :current_word

  @@all = []

  def initialize(user=nil)
    @user = user 
    @strikes = 0
    @bad_guesses = []
    @good_guesses = []
    @@all << self 
  end 


def intro 
  puts "Hello! Welcome to hangperson. What's your name?"
  name_input = gets.chomp
  self.user = User.new(name_input)
  puts "Hi #{self.user.name}!"
end 

def play_again
  puts "In total, you have #{self.user.history[:wins]} wins and #{self.user.history[:losses]} losses."
  puts "Would you like to play again? (Y/N)"
  @yes_or_no = gets.chomp.downcase
    if @yes_or_no == "y"
        game2 = Game.new(self.user)
        game2.play_game_after_intro 
    elsif @yes_or_no == "n"
        puts "See you later :)" 
        return
    else 
       puts "Please enter a valid response."
       @yes_or_no = gets.chomp.downcase
    end 
end 

def board

  @puzzle_display = 
    @current_word.chars.map do |character|
       if @good_guesses.include?(character)
          character 
       elsif character == " "
          " " 
       else 
          character = "__"
       end
    end.join(" ")


  build_hangperson(@strikes)
  puts @puzzle_display 
  puts "Your incorrect guess(es): #{@bad_guesses.join(" ")}"

end 


def play_game_after_intro  

  puts "Please select your category:"
  word_bank.keys.each do |key|
    puts key
  end
  @current_category = gets.chomp.downcase
  puts "Thanks, #{self.user.name}! You've chosen #{@current_category}."
  
    puzzle_string = ""
    @current_word = word_bank[@current_category.to_sym].sample.downcase
    @current_word.chars.each do |char|
      if char == " "
        puzzle_string << "  "
      else
        puzzle_string << "__ "
      end
    end    

  build_hangperson(strikes)
  puts puzzle_string



  while @strikes < 6 
    puts "Please guess a letter or the word."
    user_guess = gets.chomp.downcase
    @user_guess = user_guess


      if @user_guess.length > 1 
        if @user_guess == @current_word
          self.user.history[:wins] += 1
          puts "You've won!"
          self.play_again
          return 
        else 
          self.user.history[:losses] += 1 
          puts "Sorry. Your guess was wrong and you have lost!" 
          self.play_again
          return
        end 

      elsif @user_guess.length == 1 

        if @current_word.chars.include?(@user_guess)
           @good_guesses << @user_guess
           self.board
            

           if @puzzle_display.split(" ") == @current_word.chars
              self.user.history[:wins] += 1
              self.play_again
              return 
           end     
       else 
          @strikes += 1 
          puts "Your guess was wrong. You now have #{@strikes} strike(s)."
          @bad_guesses << @user_guess
          self.board
        end


      else @user_guess.length <= 0
        puts "Your input was invalid. Please enter a guess."
      end 

    end 


    self.user.history[:losses] += 1
    puts "Sorry, you've gotten #{strikes} strikes and you've lost the game."
    self.play_again

end 



end 

