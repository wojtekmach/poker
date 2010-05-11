module Poker
  class Hand < Array
    def initialize(str)
      @cards = str.split(/ /).map { |s| Card.new(s) }
      super(@cards)
    end
  end
end
