require_relative 'player'
require_relative 'deck'

class BlackJack
  attr_accessor :p1, :p2

  def self.new_game(mode="normal") # also takes modes PVP and sim - could be descendant classes
    game = BlackJack.new
    new_players
  end

  def play
    self.deal
    self.players_decide
  end

  def deal
    p1.cards << p1.deck.shift
    p2.cards << p2.deck.shift
  end

  def new_players
    self.p1 = Player.new
    self.p2 = Player.new
  end

  def players_decide
    p1.action
    p2.action
  end

  def clear_cards
    game.p1.deck = Deck.new.shuffle!
    game.p2.deck = Deck.new.shuffle!
  end

  def play_again
    self.clear_cards
    self.new_decks
    self.player_actions
  end

  def check_for_winner
    if p1.winner? && !p2.winner?
      "#{p1.name} wins with #{p1.score}!"
    elsif p2.winner? && !p1.winner?
      "#{p2.name} wins with #{p2.score}!" # no else because it would be called at the end of every round without a winner
    end
  end

end
