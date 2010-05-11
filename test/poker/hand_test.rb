require File.dirname(__FILE__) + '/../test_helper.rb'

module Poker
  class HandTest < Test::Unit::TestCase
    def self.should_recognize_value(expected, cards)
      should "recognize rank of #{cards}" do
        assert_equal expected, Hand.new(cards).value
      end
    end

    context "A hand" do
      setup do
        @hand = Hand.new("As Ks Qs Js Ts")
      end

      should "have a size" do
        assert_equal 5, @hand.size
      end

      should "have cards" do
        assert_kind_of Card, @hand[0]
      end
    end

    should "initialize with array of cards" do
      @hand = Hand.new(Card.new("As"), Card.new("Ks"))
      assert "A", @hand[0].rank
      assert "K", @hand[1].rank
    end

    should "initialize with array of strings" do
      @hand = Hand.new(*%w{As Ks})
      assert "A", @hand[0].rank
      assert "K", @hand[1].rank
    end

    should_recognize_value(1, "As Ks Qs Js Ts")
    should_recognize_value(2, "Ks Qs Js Ts 9s")
  end
end
