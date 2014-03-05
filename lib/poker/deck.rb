module Poker
  class Deck
    include Enumerable

    attr_reader :cards

    def self.default_deck
      cards = []
      Card::SUITS.each { |s|
        Card::RANKS.each { |r|
          cards << Card.new(r+s)
        }
      }
      new(cards)
    end

    def self.new_with(cards)
      cards = cards.map { |card| Card.new(card) }
      default_cards = default_deck.cards

      new(cards + (default_cards - cards))
    end

    def [](index)
      @cards[index]
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

    def shuffle
      Deck.new(cards.shuffle)
    end

    def deal
      @cards.shift
    end
  end
end
