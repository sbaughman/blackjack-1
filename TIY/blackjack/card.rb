class Card
  attr_accessor :value, :suit, :face
  def initialize(value, suit, face)
    self.suit = suit
    self.face = face
  end
end
