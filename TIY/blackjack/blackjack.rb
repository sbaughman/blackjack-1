require 'pry'
require_relative 'player'
require_relative 'dealer'
require_relative 'deck'

class BlackJack
    attr_accessor :deck, :p1, :p2

  def initialize(mode="normal")
    self.deck = Deck.new.shuffle!
    self.p1 = Player.new
    self.p2 = Dealer.new
    p1.opponent = p2
    p2.opponent = p1
    self.deal
    self.play_dealer
  end

  # @return [Object] <-- What is the point of this? Ruby Mine keeps offering to add these to my methods
  def play_dealer
    if p2.blackjack?
      show_table
      puts "Dealer Blackjack! #{and_the_winner_is(p2)}"
      query_restart
    elsif p2.busted?
      show_table
      puts "Dealer busts! #{and_the_winner_is(p1)}"
      query_restart
    else
      show_table
      do_action(p2, p2.get_action)
    end
    if p2.action == "hit"
      play_dealer
    else
      play_player
    end
  end

  def play_player
    if p1.blackjack?
      show_table
      puts "Dealer Blackjack! #{and_the_winner_is(p1)}"
      query_restart
    elsif p1.busted?
      show_table
      puts "Dealer busts! #{and_the_winner_is(p2)}"
      query_restart
    else
      show_table
      do_action(p1, p1.get_action)
    end
    if p1.action == "hit"
      play_player
    else
      show_table
      puts and_the_winner_is(check_for_most_points)
    end
  end

  def draw(player)
    player == p1 ? player.hand << deck.shift.toggle_hide : player.hand << deck.shift
  end

    # this is maybe technically wrong for Blackjack (doesn't the dealer deal cards to players one at a time?) but within the constraints of the program
  def deal
    2.times {self.draw(p1)}
    2.times {self.draw(p2)}
    # 49.times {fight(beast)}
  end


  def do_action(player, action)
    if action == "hit"
      draw(player)
    else
      nil
    end
  end

  def show_table
    p2.hand[0].toggle_hide unless p2.hand[0].hidden # I don't know why this line works the way it does - I thought it should be an if, not an unless
    puts "\n"
    puts "Dealer's Hand:\n"
    p2.hand.each {|card| puts card.info}
    puts "\n"
    puts "Your Hand:\n"
    p1.hand.each {|card| puts card.info}
    puts "\n"
    puts "Your hand's value is #{p1.hand_value}"
  end

  def clear_cards
    self.p1.hand = []
    self.p2.hand = []
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
    if p1.most_points?
      p1
    elsif p2.most_points?
      p2
    else
      tiebreaker
    end
  end

  def check_for_blackjack
    if p1.blackjack?
      p1
    elsif p2.blackjack?
      p2
    else
      false
    end
  end

  def check_for_bust
    if p1.busted? && !p2.busted?
      p1
    elsif p2.busted? && !p1.busted?
      p2
    elsif p2.busted? && p1.busted? # if both dealer and player bust, player loses
      p1
    else
      false
    end
  end

  def tiebreaker
    if p1.hand.size > p2.hand.size
      p1
    elsif p2.hand.size > p1.hand.size
      p2
    else
      p1
    end
  end

  def and_the_winner_is(winner)
    binding.pry
    "#{winner.name} wins with #{winner.hand_value}!"
  end

end

game = BlackJack.new
