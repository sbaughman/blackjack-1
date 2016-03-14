class Dealer < Player


  def initialize(name="Smokey Joe")
    self.name = name
    self.hand = []
    self.games_played = 0
    self.wins = 0
    self.losses = 0
    self.commands = %w("hit" "stay") # these opponent declarations are very clunky and brittle
  end

  def get_action
    self.action = self.hand_value >= 16 ? "stay" : "hit"
    self.action
  end

end
