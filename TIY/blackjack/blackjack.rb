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
    self.deal
    self.play_dealer
  end

  def play_dealer
    if dealer.blackjack?
      show_table
      puts "Dealer Blackjack! #{and_the_winner_is(dealer)}"
      query_restart
    elsif dealer.busted?
      show_table
      puts "Dealer busts! #{and_the_winner_is(player)}"
      query_restart
    else
      show_table
      do_action(dealer, dealer.get_action)
    end
    if dealer.action == "hit"
      play_dealer
    else
      play_player
    end
  end

  def play_player
    if player.blackjack?
      show_table
      puts "Dealer Blackjack! #{and_the_winner_is(player)}"
      query_restart
    elsif player.busted?
      show_table
      puts "Dealer busts! #{and_the_winner_is(dealer)}"
      query_restart
    else
      show_table
      do_action(player, player.get_action)
    end
    if player.action == "hit"
      play_player
    else
      show_table
      puts and_the_winner_is(check_for_most_points)
    end
  end

  def draw(player)
    player.hand << deck.shift
  end

  def deal
    2.times {self.draw(player)}
    2.times {self.draw(dealer)}
  end

  def do_action(player, action)
    if action == "hit"
      draw(player)
    else
      nil
    end
  end

  def show_table
    dealer.hand[0].toggle_hide unless dealer.hand[0].hidden
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
    binding.pry
    "#{winner.name} wins with #{winner.hand_value}!"
  end
end

game = BlackJack.new
