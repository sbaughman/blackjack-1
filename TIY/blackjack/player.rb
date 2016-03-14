class Player
  attr_accessor   :name,
                  :hand,
                  :action,
                  :games_played,
                  :wins,
                  :losses,
                  :commands,
                  :opponent,
                  :busted
                  #:profile,:nickname,:tauntphrase,

  # One deck per game!
  def initialize(name="Jim")
    self.name = name
    self.hand = []
    self.games_played = 0
    self.wins = 0
    self.losses = 0
    self.commands = %w(hit stay)
    self.busted = false
  end

  # Not having chomp in here stumped me for quite a while

  def get_action(input="")
    until self.commands.include?(input)
      puts "Enter an action for this turn: #{commands}"
      input = STDIN.gets.chomp.downcase
    end
      self.action = input
      input
  end

  def hand_value
    hand.map{|card| card.value}.reduce(:+) || 0
  end

  def blackjack?
    hand_value == 21
  end

  def most_points?
    hand_value > opponent.hand_value
  end

  def busted?
    self.busted = true if hand_value > 21
  end

  def stay
    self.action = "stay"
  end

end
