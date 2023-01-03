require_relative './player'

class Question
  attr_accessor :get_question, :get_answer

  def initialize
    @num1 = rand(1...20)
    @num2 = rand(1...20)
  end

  def get_question(player)
    player + " : What does #{@num1} and #{@num2} make?"
  end

  def get_answer
    answer = @num1 + @num2
  end

end

