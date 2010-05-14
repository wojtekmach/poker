require File.dirname(__FILE__) + '/../test_helper.rb'

module Poker
  class HandTest < Test::Unit::TestCase
    def self.should_recognize_value(expected, cards)
      should "recognize value of #{cards}" do
        assert_equal expected, Hand.new(cards).value
      end
    end

    def self.should_recognize_rank(expected, cards)
      should "recognize rank of #{cards}" do
        assert_equal expected, Hand.new(cards).rank
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

      should "be comparable" do
        assert @hand > Hand.new("5s 4s 3s 2s As")
        assert @hand == Hand.new("Ad Kd Qd Jd Td")
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

    should_recognize_rank "Royal Flush",    "As Ks Qs Js Ts"
    should_recognize_rank "Straight Flush", "Ks Qs Js Ts 9s"
    should_recognize_rank "Four of a Kind", "Ac Ad Ah As Ks"
  end
end
