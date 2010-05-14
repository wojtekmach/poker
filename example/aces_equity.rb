# This example shows equity (wins/total) of Aces against a random hand
# For the sake of simplicity Aces are Ac Ad
#
# It's a *little* slower than PokerStove
$: << File.dirname(__FILE__) + "/../lib"
require 'poker'

include Poker

wins = 0
n = 300 
deck = Deck.new

def find_card(deck, indexes, size)
  loop do
    c = rand(size)
    unless indexes.include?(c)
      indexes << c
      return c
    end
  end
end

n.times {
  # indexes of used cards. Ac & Ad is always used
  indexes = [48, 49]
  hole1 = 48, 49
  hole2 = []
  
  hole2 << find_card(deck, indexes, 50)
  hole2 << find_card(deck, indexes, 49)

  board = []
  board << find_card(deck, indexes, 48)
  board << find_card(deck, indexes, 47)
  board << find_card(deck, indexes, 46)
  board << find_card(deck, indexes, 45)
  board << find_card(deck, indexes, 44)

  hand1 = Hand.best((hole1 + board).map { |i| deck[i] })
  hand2 = Hand.best((hole2 + board).map { |i| deck[i] })
  wins += 1 if hand1 > hand2 
}
puts "Total iterations: #{n}"
puts "EV: #{1.0 * wins / n * 100}%"
