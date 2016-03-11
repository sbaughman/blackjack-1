require_relative 'player'
require_relative 'dealer'
require_relative 'deck'

class BlackJack
  attr_accessor :p1, :p2

  def initialize(mode="normal")
    new_players
    action_phase
  end

  def play
    self.deal
    self.action_phase
  end

  def deal
    p1.cards << p1.deck.shift
    p2.cards << p2.deck.shift
  end

  def new_players
    self.p1 = Player.new
    self.p2 = Dealer.new
  end

  def action_phase
    p1.action
    p2.action
  end

  def clear_cards

  end

  def new_decks
    self.p1.deck = Deck.new.shuffle!
    self.p2.deck = Deck.new.shuffle!
  end

  def play_again(mode=normal)
    self.clear_cards
    self.new_decks
    self.action_phase
  end

  def check_for_winner
    if p1.winner? && !p2.winner?
      "#{p1.name} wins with #{p1.score}!"
    elsif p2.winner? && !p1.winner?
      "#{p2.name} wins with #{p2.score}!" # no else because it would be called at the end of every round without a winner
    end
  end

end

puts BlackJack.new.p1.deck.inspect
