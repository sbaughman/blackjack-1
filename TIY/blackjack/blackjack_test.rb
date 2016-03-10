require 'minitest/autorun'
require_relative: 'blackjack'

class BlackJackTest < MiniTest::Test

def test_are_you_there_God_its_a_me_Mario
  assert BlackJack.new.is_a? BlackJack
end

def test_players_have_52_card_decks
  assert Player.new.deck.size
end

def test_obssess_over_deck_size
  his = Player.new
  my = Player.new
  1000.times do assert his.deck.size == my.deck.size end
end
