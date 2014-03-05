# Poker

[![Build Status](https://secure.travis-ci.org/wojtekmach/poker.png?branch=master)](http://travis-ci.org/wojtekmach/poker)
[![Code Climate](https://codeclimate.com/github/wojtekmach/poker.png)](https://codeclimate.com/github/wojtekmach/poker)
[![Dependency Status](https://gemnasium.com/wojtekmach/poker.png)](https://gemnasium.com/wojtekmach/poker)

Ruby library for evaluating poker hands (with Cactus Kev's evaluator)

## Examples

```ruby
hand1 = Poker::Hand.new('As Ks Qs Js Ts')
hand2 = Poker::Hand.new('Ac Ad Ah As Kc')

hand1.rank    # => "Royal Flush"
hand2.rank    # => "Four of a Kind"
hand1 > hand2 # => true
```

See <https://github.com/wojtekmach/poker/tree/master/examples>

## License

Ruby code of this  project is released under MIT license (see LICENSE.txt). Hand evaluator is written by Kevin L. Suffecool (http://www.suffecool.net/poker/evaluator.html)
