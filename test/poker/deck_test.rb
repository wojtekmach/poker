require 'test_helper'

module Poker
  describe Deck do
    before do
      @deck = Deck.default_deck
    end

    it "has 52 elements" do
      assert_equal 52, @deck.size
      @deck.each { |card| assert_kind_of Card, @deck.first }
    end

    it "has 13 ranks" do
      assert_equal 13, @deck.map(&:rank).uniq.size
    end

    it "has 4 suits" do
      assert_equal 4, @deck.map(&:suit).uniq.size
    end

    describe "deal" do
      before do
        @card = @deck.deal
      end

      it "returns a card from the top of the deck" do
        assert_kind_of Card, @card
        assert_equal "2c", @card.to_s
      end

      it "removes that card from the deck" do
        assert_equal 51, @deck.size
        assert @deck.none? { |card| card == @card }
      end
    end
  end
end
