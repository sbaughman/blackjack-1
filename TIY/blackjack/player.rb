class Player
  attr_accessor   :name,
                  :hand,
                  :games_played,
                  :wins,
                  :losses,
                  :commands,
                  :opponent
                  #:profile,:nickname,:tauntphrase,

  # One deck per game!
  def initialize(name="Jim")
    self.name = name
    self.hand = []
    self.games_played = 0
    self.wins = 0
    self.losses = 0
    self.commands = %w("hit" "stay")
    BlackJack.players[1] = Dealer.new
    self.opponent = BlackJack.players[1] # Opponent declarations are fragile
  end

  # Not having chomp in here stumped me for quite a while

  def action(input=nil)
    until commands.include?(input)
      puts "Enter an action for this turn: #{commands.inspect}"
      input = STDIN.gets.chomp
    end
  end

  def hand_value
    self.hand.map{|card| card.value}.reduce(:+) || 0
  end

  def winner?
    self.hand_value > opponent.hand_value && self.hand_value <= 21
  end

  #/* So can I initialize a new deck for the game and have both player decks point to that deck? That would be best. If not, can I make each player deck equal the game deck, then shift each deck whenever a player draws put only give cards to the drawing player? */#

  def draw
    hand << BlackJack.deck.shift
  end

  def stay

  end

end
