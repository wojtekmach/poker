module Poker
  class Deck < Array
    def initialize
      cards = []
      Card::RANKS.each { |r|
        Card::SUITS.each { |s|
          cards << Card.new(r+s)
        }
      }
      super(cards)
    end
  end
end
