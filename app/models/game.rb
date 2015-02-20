class Game
  def initialize(throw)
    @outcomes = {
      :rock =>     {:scissors => true, :paper => false, :rock => :tie },
      :paper =>    {:rock => true, :scissors => false, :paper => :tie},
      :scissors => {:paper => true, :rock => false, :scissors => :tie}
    }
    @outcomes.include?(throw.downcase.to_sym) ? @throw = throw.downcase.to_sym : @throw = @outcomes.keys.sample
    @cpu_throw = @outcomes.keys.sample
  end

  def results
    outcome = @outcomes[@throw][@cpu_throw]

    case outcome
      when :tie
        message = "You tied. Better luck next time."
      when true
        message = "You are a stud. Great win."
      when false
        message = "You win some you lose some. And you just lost one..."
    end

    { :results => outcome, :message => message, :throw => @throw, :cpu_throw => @cpu_throw }
  end
end
