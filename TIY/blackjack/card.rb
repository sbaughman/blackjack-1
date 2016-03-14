class Card
  attr_accessor :value, :suit, :face, :hidden
  def initialize(value=10, suit="hearts", face="Queen")
    self.suit = suit
    self.value = value
    self.face = face
    self.hidden = false
  end

  def info
    self.hidden ? "#{face} of #{suit}" : "A Card"
  end

  def toggle_hide
    self.hidden = !self.hidden
    self
  end

end
