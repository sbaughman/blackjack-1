require_relative 'card'

class Deck < Array
  attr_accessor :card
  def initialize
    self.card_key = [2, 3, 4, 5, 6, 7, 8, 9, "10JackQueenKing", "Ace"]
    fill_suit("hearts")
    fill_suit("diamonds")
    fill_suit("clubs")
    fill_suit("spades")
  end

  def get_card_value

  end

  def fill_suit(suit="hearts")
    self.push(card_key.each_with_index { |value, index | Card.new(value.is_a? Numeric ? value : index, suit, face ) }
    end
  end
end
