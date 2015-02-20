# This file is called game.rb
# It contains the class Game
# This class holds all of the rock paper scissor logic and processing
class Game
  def initialize(throw, opt = {})
    @outcomes = {
      rock:     { scissors: true, paper: false, rock: :tie },
      paper:    { rock: true, scissors: false, paper: :tie },
      scissors: { paper: true, rock: false, scissors: :tie }
    }
    @throw = throw.downcase.to_sym if @outcomes.include?(throw.downcase.to_sym)
    @cpu_throw = @outcomes.keys.sample
    @cpu_throw = opt[:cpu_throw].downcase.to_sym if opt[:cpu_throw]
  end

  def results
    outcome = @outcomes[@throw][@cpu_throw]

    case outcome
    when :tie
      message = 'You tied. Better luck next time.'
    when true
      message = 'You are a stud. Great win.'
    when false
      message = 'You win some you lose some. And you just lost one...'
    end

    { results: outcome, message: message, throw: @throw, cpu_throw: @cpu_throw }
  end
end
