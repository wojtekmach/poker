require 'test_helper'

module Poker
  describe Hand do
    before do
      @hand = Hand.new("As Ks Qs Js Ts")
    end

    it "is comparable" do
      assert @hand > Hand.new("5s 4s 3s 2s As")
      assert @hand == Hand.new("Ad Kd Qd Jd Td")
    end

    it "responds to #to_s" do
      assert_equal "As Ks Qs Js Ts", @hand.to_s
    end

    it "returns the best 5-card hand from 7 cards" do
      cards = %w{ 2c 3c 4c Ac Ad Ah As }
      assert_equal "Four of a Kind", Hand.best(cards).rank
    end

    it "displays cards in order" do
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
      assert_equal "2c 2d 2s 5c 5d", Hand.new("2s 2d 2c 5d 5c").to_s
    end
  end
end
