require 'test_helper'

module Poker
  describe Card do
    before do
      @card = Card.new("As")
    end

    it "has a rank" do
      assert_equal "A", @card.rank
    end

    it "has a rank value" do
      assert_equal 12, @card.rank_value
    end

    it "has a suit" do
      assert_equal "s", @card.suit
    end

    it "has a suit value" do
      assert_equal 3, @card.suit_value
    end

    it "has a value" do
      assert_equal 268442665, @card.value
    end

    it "responds to #to_s" do
      assert_equal "As", @card.to_s
    end

    it "can be compared" do
      assert_equal Card.new("As"), Card.new("As")
      refute_equal Card.new("As"), Card.new("Ks")
      refute_equal Card.new("As"), Card.new("Ac")
    end
  end
end
