class BlackJack
  attr_accessor :p1, :p2

  def self.new_game(mode="normal")
    game = BlackJack.new
    new_players
    game.p1.deck = Deck.new.shuffle!
    game.p2.deck = Deck.new.shuffle!
  end

  def clear_cards
    game.p1.deck = Deck.new.shuffle
    game.p2.deck.shuffle
  end

  def play_again
    clear_cards
    new_decks
    player_actions
  end

  def check_for_winner
    if p1.winner? && !p2.winner?
      "#{p1.name} wins with #{p1.score}!"
    elsif p2.winner? && !p1.winner?
      "#{p2.name} wins with #{p2.score}!" # no else because it would be called at the end of every round without a winner
    end
  end

end
