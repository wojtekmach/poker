require File.dirname(__FILE__) + '/../test_helper.rb'

module Poker
  class CardTest < Test::Unit::TestCase
    context "A card" do
      setup do
        @card = Card.new("As") # Ace of Spades
      end

      should "have a rank" do
        assert_equal "A", @card.rank
      end

      should "have a suit" do
        assert_equal "s", @card.suit
      end
    end
  end
end
