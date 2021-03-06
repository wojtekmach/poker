require File.dirname(__FILE__) + '/../../ext/handeval/handeval'

module Poker
  class Hand
    include Enumerable
    include Comparable

    def self.best(cards)
      best = nil
      cards.combination(5).each do |c|
        hand = Hand.new(*c)
        best = hand if !best || hand > best
      end
      best
    end

    def initialize(*str_or_ary)
      if str_or_ary.size == 1
        @cards = str_or_ary[0].split(/ /).map { |s| Card.new(s) }
      else
        if str_or_ary[0].kind_of?(Card)
          @cards = str_or_ary
        else
          @cards = str_or_ary.map { |s| Card.new(s) }
        end
      end
    end

    def value
      HandEval.eval(*(@cards.map { |c| c.value }))
    end

    def rank
      v = value
      return "High Card"       if v > 6185
      return "Pair"            if v > 3325
      return "Two Pair"        if v > 2467
      return "Three of a Kind" if v > 1609
      return "Straight"        if v > 1599
      return "Flush"           if v > 322
      return "Full House"      if v > 166
      return "Four of a Kind"  if v > 10
      return "Straight Flush"  if v > 1
      return "Royal Flush"     if v == 1
    end

    def <=>(hand)
      - (value <=> hand.value)
    end

    def [](index)
      @cards[index]
    end

    def each(&block)
      @cards.each(&block)
    end

    def size
      @cards.size
    end

    def to_s
      r = rank
      if r == "Pair" || r == "Two Pair" || r == "Three of a Kind" ||
         r == "Full House" || r == "Four of a Kind"
        pairs_to_s
      elsif r == "Straight Flush" || r == "Straight"
        straights_to_s
      else
        high_card_to_s
      end
    end

    def to_str
      to_s
    end

    private

    def pairs_to_s
      r = rank
      h = @cards.inject({}) { |h, c|
        r = c.rank_value + 1
        h[r] = h[r] ? h[r] + 1 : 1
        h
      }

      @cards.sort_by { |c|
        if h[c.rank_value + 1] > 0
          - ((h[c.rank_value + 1] * 10_000) + (c.rank_value + 1) * 100) +
            c.suit_value
        else
          - c.rank_value + c.suit_value
        end
      }.join(" ")
    end

    def straights_to_s
      @cards.sort_by { |c|
        if c.rank_value == 12
          10_000
        else
          - (c.rank_value + 1) * 100 - c.suit_value
        end
      }.join(" ")
    end

    def high_card_to_s
      @cards.sort_by { |c| - (c.rank_value + 1) * 100 - c.suit_value }.
        join(" ")
    end
  end
end
