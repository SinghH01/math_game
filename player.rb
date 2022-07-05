class  Player 

  attr_accessor :lives, :turn
   
  def initialize
    @lives = 3
    @turn = true  
  end 

  def lose_life
    @lives -= 1
  end 

end 
