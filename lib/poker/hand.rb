require File.dirname(__FILE__) + '/../../ext/handeval/handeval'

module Poker
  class Hand < Array
    include Comparable

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
      super(@cards)
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

    def to_s
      self.join(" ")
    end
  end
end
