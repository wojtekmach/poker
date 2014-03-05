# Random Heads-Up example
#
$: << File.dirname(__FILE__) + "/../lib"
require 'poker'

include Poker

n = 1000
heros, villians, splits = 0, 0, 0
deck = Deck.default_deck

n.times {
  deck = deck.shuffle
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
    heros += 1
  when -1
    puts "Villian wins"
    villians += 1
  else
    puts "Split"
    splits += 1
  end
  puts
}

puts "Total iterations: #{n}"
puts "Hero wins:    #{heros}"    + " " + (1.0 * heros / n * 100).to_s + "%"
puts "Villian wins: #{villians}" + " " + (1.0 * villians / n * 100).to_s + "%"
puts "Splits:       #{splits}"   + " " + (1.0 * splits / n * 100).to_s + "%"
