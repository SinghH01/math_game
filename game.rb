require "./player"
require "./question"

class Game 
    
  def initialize
  @player1 = Player.new
  @player2 = Player.new
  end 

  def checkScore 
    if(@player1.lives == 0)
      puts "Player 2 wins with a score of #{@player2.lives}/3"
      puts ""  
      puts "----- GAME OVER -----"  
      puts ""  
      exit
    end
    if(@player2.lives == 0)
      puts "Player 1 wins with a score of #{@player1.lives}/3"
      puts ""  
      puts "----- GAME OVER -----"  
      puts ""  
      exit
    end
  end

  def start 
    ques = Question.new
    answer = ques.number1 + ques.number2

    if @player1.turn
      puts "Player 1: What does #{ques.number1} plus #{ques.number2} equal ?"
      print "> "
      user_answer = gets.chomp

      if(user_answer.to_i == answer)
        puts "Correct !"
        puts "P1: #{@player1.lives}/3 vs P2: #{@player2.lives}/3"
      else
        puts "Sorry that's wrong."
        @player1.lose_life
        puts "P1: #{@player1.lives}/3 vs P2: #{@player2.lives}/3"
        
        checkScore
      end
      
      @player1.turn = false

      puts " "
      puts "----- NEW TURN -----"    
      puts " "

      start 

    else 
      
      puts "Player 2: What does #{ques.number1} plus #{ques.number2} equal ?"
      print "> "
      user_answer = gets.chomp

      if(user_answer.to_i == answer)
        puts "Correct !"
        puts "P1: #{@player1.lives}/3 vs P2: #{@player2.lives}/3"
      else
        puts "Sorry that's wrong."
        @player2.lose_life
        puts "P1: #{@player1.lives}/3 vs P2: #{@player2.lives}/3"

        
        checkScore
      end
      
      @player2.turn = false
      @player1.turn = true

      puts " "
      puts "----- NEW TURN -----"    
      puts " "
      start 
      

    end 

  end 

end





