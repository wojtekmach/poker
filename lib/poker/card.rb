module Poker
  class Card
    RANKS = %w{ 2 3 4 5 6 7 8 9 T J Q K A }
    SUITS = %w{ c d h s }

    attr_reader :rank, :rank_value, :suit, :suit_value

    def initialize(str)
      @rank, @suit = str.split(//)
      @rank_value = RANKS.index(@rank)
      @suit_value = SUITS.index(@suit)
    end
  end
end
