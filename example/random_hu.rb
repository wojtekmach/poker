# Random Heads-Up example
#
$: << File.dirname(__FILE__) + "/../lib"
require 'poker'

include Poker

n = 10
deck = Deck.new

n.times {
  deck.shuffle!
  hole1, hole2, board = [], [], []

  hole1 << deck[-1]
  hole2 << deck[-2]
  hole1 << deck[-3]
  hole2 << deck[-4]

  board << deck[-5]
  board << deck[-6]
  board << deck[-7]
  board << deck[-8]
  board << deck[-9]
  
  hand1 = Hand.best(hole1 + board)
  hand2 = Hand.best(hole2 + board)

  puts "Hero:    " + hole1.join(" ")
  puts "Villian: " + hole2.join(" ")
  puts "Board:   " + board.join(" ")
  puts
  puts "Hero:    " + hand1.to_s + " " + hand1.rank
  puts "Villian: " + hand2.to_s + " " + hand2.rank
  case hand1 <=> hand2
  when 1
    puts "Hero wins"
  when -1
    puts "Villian wins"
  else
    puts "Split"
  end
  puts
}
