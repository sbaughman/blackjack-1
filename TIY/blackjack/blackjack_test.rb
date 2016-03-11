require 'minitest/autorun'
require_relative 'blackjack'

class BlackJackTest < MiniTest::Test

  def test_are_you_there_God_its_a_me_Mario
    assert BlackJack.new.is_a? BlackJack
  end

  def test_players_have_decks_with_52_cards
    assert Player.new.deck.size == 52
  end

  def test_obssess_over_deck_size
    his = Player.new
    my = Player.new
    1000.times { assert his.deck.size == my.deck.size }
  end

  def test_suits_are_hearts_diamonds_clubs_spades
    x = Deck.new.map {|card| card.suit }.uniq.sort
    assert x == ["clubs", "diamonds", "hearts", "spades"], x.inspect
  end

  def test_cards_have_numeric_values
    assert (Card.new.value.is_a? Numeric), Card.new.value
  end

  def test_card_have_suits_that_are_strings # without the parens this tries to pass failure message as argument to is_a?
    assert (Card.new.suit.is_a? String), Card.new.inspect
  end

  # get count for each suits, how?
  def test_there_is_an_equal_number_of_cards_of_each_suit
    x = Deck.new.map {|card| card.suit }
    assert x.count("hearts") == 13 &&  x.count("diamonds") == 13 && x.count("spades") == 13 && x.count("clubs") == 13, x.inspect
  end

  def test_fill_suit
    assert Deck.new.fill_suit, "Fill suit isn't here"
  end

  def test_card_info
    assert Card.new.info, "Card info isn't here"
  end

end