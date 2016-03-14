require 'pry'
require_relative 'player'
require_relative 'dealer'
require_relative 'deck'

class BlackJack
    attr_accessor :deck, :player, :dealer

  def initialize(mode="normal")
    self.deck = Deck.new.shuffle!
    self.player = Player.new
    self.dealer = Dealer.new
    dealer.opponent = player
    player.opponent = dealer
  end

  def play
    deal
    unless dealer.blackjack? || dealer.busted? || player.blackjack? || player.busted?
      player_move(player)
      player_move(dealer)
    end
    puts and_the_winner_is(check_for_most_points)
  end

  def player_move(player)
    show_table
    unless player.busted? || player.blackjack?
      do_action(player, player.get_action)
      if player.action == "hit"
        player_move(player)
      else
        show_table
      end
    end
  end

  def draw(player)
    player.hand << deck.shift
  end

  def deal
    2.times {self.draw(player)}
    2.times {self.draw(dealer)}
    dealer.hand[0].toggle_hide
  end

  def do_action(player, action)
    if action == "hit"
      draw(player)
    else
      nil
    end
  end

  def show_table
    puts "\n"
    puts "Dealer's Hand:\n"
    dealer.hand.each {|card| puts card.info}
    puts "\n"
    puts "Your Hand:\n"
    player.hand.each {|card| puts card.info}
    puts "\n"
    puts "Your hand's value is #{player.hand_value}"
  end

  def clear_cards
    self.player.hand = []
    self.dealer.hand = []
  end

  def new_deck
    self.deck = Deck.new.shuffle!
  end

  def query_restart
    puts "Would you like to play again?"
    answer = STDIN.gets.chomp.downcase
    play_again if answer.include?("y")
  end

  def play_again(mode="normal")
    self.clear_cards
    self.new_deck
    self.deal
    self.play_dealer
  end

  def check_for_most_points
    if player.most_points?
      player
    elsif dealer.most_points?
      dealer
    else
      tiebreaker
    end
  end

  def check_for_blackjack
    if player.blackjack?
      player
    elsif dealer.blackjack?
      dealer
    else
      false
    end
  end

  def check_for_bust
    if player.busted? && !dealer.busted?
      player
    elsif dealer.busted? && !player.busted?
      dealer
    elsif dealer.busted? && player.busted? # if both dealer and player bust, player loses
      player
    else
      false
    end
  end

  def tiebreaker
    if player.hand.size > dealer.hand.size
      player
    elsif dealer.hand.size > player.hand.size
      dealer
    else
      player
    end
  end

  def and_the_winner_is(winner)
    "#{winner.name} wins with #{winner.hand_value}!"
  end
end

BlackJack.new.play
