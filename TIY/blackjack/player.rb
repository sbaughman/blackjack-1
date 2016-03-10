class Player
  attr_accessor   :name,
                  :deck,
                  :cards,
                  :games_played
                  :wins,
                  :losses
                  #:profile,:nickname,:tauntphrase,

  def initialize(name="Jim")
    self.name = name
    self.deck = Deck.new.shuffle!
    self.cards = []
    self.games_played = 0
    self.wins = 0
    self.losses = 0
  end

  def action()
  # def new_shuffled_deck

end
