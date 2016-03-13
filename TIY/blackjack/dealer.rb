class Dealer < Player


  def initialize(name="Smokey Joe")
    self.name = name
    self.hand = []
    self.games_played = 0
    self.wins = 0
    self.losses = 0
    self.commands = %w("hit" "stay")
    self.opponent = BlackJack.players[0] # these opponent declarations are very clunky and brittle
  end

  def action
    think_of_best_play
  end

  def think_of_best_play
    (self.hand_value >= 16) ? stay : draw
  end

end
