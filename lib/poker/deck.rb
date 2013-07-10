module Poker
  class Deck
    include Enumerable

    def initialize
      @cards = []
      Card::SUITS.each { |s|
        Card::RANKS.each { |r|
          @cards << Card.new(r+s)
        }
      }
    end

    def each(&block)
      @cards.each(&block)
    end

    def size
      @cards.size
    end

    def deal
      @cards.shift
    end
  end
end
