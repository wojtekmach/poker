module Poker
  class Deck < Array
    def initialize
      cards = []
      Card::SUITS.each { |s|
        Card::RANKS.each { |r|
          cards << Card.new(r+s)
        }
      }
      super(cards)
    end
  end
end
