class Player
  attr_accessor   :name,
                  :deck,
                  :hand,
                  :games_played,
                  :wins,
                  :losses,
                  :commands
                  #:profile,:nickname,:tauntphrase,

  def initialize(name="Jim")
    self.name = name
    self.deck = Deck.new.shuffle!
    self.hand = []
    self.games_played = 0
    self.wins = 0
    self.losses = 0
    self.commands = ["hit", "stay", "look"]
  end

  def action(input=gets)
    until commands.include?(input.downcase)
      puts "Enter a valid command, like one of the following: #{commands.inspect}"
      input = gets
    end
    input
  end

  def hand_value
    self.hand.map{|card| card.value}.reduce(:+)
  end

  def hit

  end

  def stay

  end

end
