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

      should "have a rank value" do
        assert_equal 12, @card.rank_value
      end

      should "have a suit" do
        assert_equal "s", @card.suit
      end

      should "have a suit value" do
        assert_equal 3, @card.suit_value
      end

      should "have a value" do
        assert_equal 268442665, @card.value
      end

      should "respond to #to_s" do
        assert_equal "As", @card.to_s
      end
    end
  end
end
