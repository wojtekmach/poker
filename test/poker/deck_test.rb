require File.dirname(__FILE__) + '/../test_helper.rb'

module Poker
  class DeckTest < Test::Unit::TestCase
    context "A Deck" do
      setup do
        @deck = Deck.new
      end

      should "have 52 elements" do
        assert_equal 52, @deck.size
      end

      should "have cards" do
        assert_kind_of Card, @deck.first
      end

      should "have 13 ranks" do
        assert_equal 13, @deck.map { |c| c.rank }.uniq.size
      end

      should "have 4 suits" do
        assert_equal 4, @deck.map { |c| c.suit }.uniq.size
      end
    end
  end
end
