require File.dirname(__FILE__) + '/../../ext/handeval/handeval'

module Poker
  class Hand < Array
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
  end
end
