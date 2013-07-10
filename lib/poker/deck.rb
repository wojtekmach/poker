module Poker
  class Deck
    include Enumerable

    def self.default_deck
      cards = []
      Card::SUITS.each { |s|
        Card::RANKS.each { |r|
          cards << Card.new(r+s)
        }
      }
      new(cards)
    end

    def initialize(cards)
      @cards = cards
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
