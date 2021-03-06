require_relative 'card'

class Deck < Array
  def initialize
    fill_suit("Hearts")
    fill_suit("Diamonds")
    fill_suit("Clubs")
    fill_suit("Spades")
  end

  def card_key
    {2 => 2, 3 => 3, 4 => 4, 5 => 5, 6 => 6, 7 => 7, 8 => 8, 9 => 9, 10 => 10, "Jack" => 10, "Queen" => 10, "King" => 10, "Ace" => 11}
  end

  def fill_suit(suit="hearts")
    card_key.each_pair { |name, value| self << Card.new(value, suit, name.to_s) }
  end
end
