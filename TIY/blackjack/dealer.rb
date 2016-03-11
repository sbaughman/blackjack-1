class Dealer < Player

  def action
    think_of_best_play
  end

  def think_of_best_play
    if hand.value >= 16
      stay
    else
      hit
    end
  end

end
