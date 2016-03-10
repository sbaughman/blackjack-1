require_relative 'card'

class Deck < Array
  def initialize(num=1)
    self.suits = ["Hearts", "Diamonds", "Spades", "Clubs"]
  end
end
