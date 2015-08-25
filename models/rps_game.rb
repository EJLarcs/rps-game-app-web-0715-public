class RPSGame

  VALID_ITEMS = [:rock, :paper, :scissors]

  WINNING_CONDITIONS =
  #store as symbols
  #if you have a hash with symbols
  {
    rock: :scissors,
    scissors: :paper,
    paper: :rock,

  }

  def initialize(play_type)
    @play_type = play_type
    raise PlayTypeError unless VALID_ITEMS.include?(@play_type)
  end

  def play_type
    @play_type
  end

  def self.valid_play?(play_type)
    VALID_ITEMS.include?(play_type)
  end

  def computer_play
    VALID_ITEMS[rand(0..2)]
  end

  def won?
   if WINNING_CONDITIONS[@play_type] == computer_play
     true
   else
    false
   end
  end

  def tied?
    if @play_type == computer_play
    true
    else
    false
    end
    #!!(@play_type == computer_play)
  end

  def lost?
    if WINNING_CONDITIONS[computer_play] == @play_type
    true
    else
    false
    end
    #!(won? || tied?)
  end

  def game_status
    if lost?
    "You lost"
    elsif tied?
    "You're tied!"
    elsif won?
    "YIPPEEE YOU WON!"
    end
  end

end


class PlayTypeError < StandardError
#this makes this type of error a regular error by inheriting all properties
end
