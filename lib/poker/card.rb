module Poker
  class Card
    RANKS = %w{ 2 3 4 5 6 7 8 9 T J Q K A }
    SUITS = %w{ c d h s }
    PRIMES = [2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37, 41]

    attr_reader :rank, :rank_value, :suit, :suit_value

    def initialize(str)
      @rank, @suit = str.split(//)
      @rank_value = RANKS.index(@rank)
      @suit_value = SUITS.index(@suit)
    end

    # An integer is made up of four bytes. The high-order
    # bytes are used to hold the rank bit pattern, whereas
    # the low-order bytes hold the suit/rank/prime value
    # of the card.
    #
    # +--------+--------+--------+--------+
    # |xxxbbbbb|bbbbbbbb|cdhsrrrr|xxpppppp|
    # +--------+--------+--------+--------+
    #
    # p = prime number of rank (deuce=2,trey=3,four=5,five=7,...,ace=41)
    # r = rank of card (deuce=0,trey=1,four=2,five=3,...,ace=12)
    # cdhs = suit of card
    # b = bit turned on depending on rank of card   # 
    def value
      PRIMES[rank_value] | (rank_value << 8) | 0x8000 >> suit_value |
        (1 << (16 + rank_value))
    end
  end
end
