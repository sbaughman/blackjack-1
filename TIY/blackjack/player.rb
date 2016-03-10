class Player
  :attr_accessor  :name,
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
  end
end
