class Card
  attr_accessor :value, :suit, :face
  def initialize(value=10, suit="hearts", face="Queen")
    self.suit = suit
    self.value = value
    self.face = face
  end

  def info
    "#{face} of #{suit}"
  end

end
