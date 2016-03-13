require_relative 'player'
require_relative 'dealer'
require_relative 'deck'

# I used class variables because it was an easy way to let my players know about the game deck and about each other.
# You're welcome for an easy fix!

class BlackJack
  attr_accessor :p1, :p2
  @@deck = Deck.new.shuffle!
  @@players = [Player.new] # this Player.new then calls a Dealer.new to join it in the player array

  def self.deck
    @@deck
  end

  # Obviously trimming one of the two player methods below would be good, but I think I need the both now for things to run
  def self.players
    @@players
  end

  def players
    @@players
  end

  def initialize(mode="normal")
    self.p1 = self.players[0]
    self.p2 = self.players[1]
    self.deal
    self.play_round
  end

  # @return [Object] <-- What is the point of this? Ruby Mine keeps offering to add these to my methods
  def play_round
    self.action_phase
    self.check_for_winner
  end

  def deal
    2.times {self.p1.draw}
    2.times {self.p2.draw}
  end

  # wanted to have indices in @@players always overwrite self.p1 and self.p2, or for self.p1 and self.p2 to always point to @@players[0] and @@players[1]
  # this might need to be on multiple lines, we'll find out
  def new_players
    self.players = [ self.p1 = Player.new, self.p2 = Dealer.new ]
  end

  def action_phase
    p1.action
    p2.action
  end

  def clear_cards
    self.p1.hand = []
    self.p2.hand = []
  end

  def new_deck
    self.deck = Deck.new.shuffle!
  end

  def play_again(mode=normal)
    self.clear_cards
    self.new_deck
    self.deal
    self.play_round
  end

  def check_for_winner
    if p1.winner? && !p2.winner?
      "#{p1.name} wins with #{p1.hand_value}!"
    elsif p2.winner? && !p1.winner?
      "#{p2.name} wins with #{p2.hand_value}!" # no else because it would be triggered at the end of every round without a winner
    end
  end

end

game = BlackJack.new
game.action_phase
