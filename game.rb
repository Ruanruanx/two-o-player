require_relative './question'
require_relative './player'

class Game
  attr_accessor :player1, :player2, :question

  def initialize
    play_game
  end

  def play_game
    @player1 = Player.new("Player1")
    @player2 = Player.new("Player2")
    @current_turn = 1
    @current_player = @player1
    while @player1.lives>0 && @player2.lives >0
      @question = Question.new
      ask_question
      get_answer
      verify_answer
      turn
    end
    win_message
  end

#show question, get answer
  def ask_question 
    puts @question.get_question(@current_player.name)
  end

  def get_answer
    @a = gets.chomp
  end

  def verify_answer #take input, find question, check answer
    if (@a.to_s == @question.get_answer.to_s)
      puts "YES! You are correct!"
    else
      puts "Seriously? No!"
      lose_update_life
    end
  end


  def lose_update_life #find player, update lives
    @current_player.lives -= 1
  end

  def turn
    puts "P1: #{@player1.lives} /3 vs P2: #{@player2.lives}/3"
    puts "------- New Turn -------"
    @current_turn += 1
    @current_player = @current_turn.even? ? @player2 : @player1
  end

  def win_message
    puts "#{@current_player.name} wins with a score of #{@current_player.lives}/3"
    puts "--------- Game Over ---------"
    puts "Good bye!"
  end
end

game = Game.new

