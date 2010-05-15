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

      should "respond to #to_s" do
        assert_equal "As Ks Qs Js Ts", @hand.to_s
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

    should "get the best 5-card hand from 7 cards" do
      cards = %w{ 2c 3c 4c Ac Ad Ah As }
      assert_equal "Four of a Kind", Hand.best(cards).rank
    end

    should "display cards with order" do
      assert_equal "Ac Ad Qc Qd Kc", Hand.new("Kc Qd Ac Qc Ad").to_s
      assert_equal "Ac Ad Qc Qd Kc", Hand.new("Kc Qc Ad Qd Ac").to_s
      assert_equal "Ac Ad Qc Qd Kc", Hand.new("Kc Ad Ac Qc Qd").to_s
      assert_equal "Tc Td Ac Qd 2c", Hand.new("2c Qd Ac Td Tc").to_s
      assert_equal "Tc Td Ac Kd Qc", Hand.new("Qc Kd Ac Td Tc").to_s
      assert_equal "Tc Td Ts Ac Qc", Hand.new("Ts Qc Ac Td Tc").to_s
      assert_equal "Tc Td Ts Ac Ad", Hand.new("Ts Ad Ac Td Tc").to_s
      assert_equal "Ac Ad As Tc Td", Hand.new("As Td Tc Ad Ac").to_s
      assert_equal "2c 2d 2h 2s Ad", Hand.new("2s Ad 2d 2c 2h").to_s
      assert_equal "5c 4c 3c 2c Ad", Hand.new("2c 4c Ad 5c 3c").to_s
      assert_equal "Ac Tc 4c 3c 2c", Hand.new("2c 4c Tc Ac 3c").to_s
    end
  end
end
