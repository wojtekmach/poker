require File.dirname(__FILE__) + '/../test_helper.rb'

module Poker
  class HandTest < Test::Unit::TestCase
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
  end
end
