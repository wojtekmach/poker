# Poker

Ruby library for evaluating poker hands (with Cactus Kev's evaluator)

[![Gem Version](http://img.shields.io/gem/v/poker.svg)][gem]
[![Build Status](http://img.shields.io/travis/wojtekmach/poker.svg)][travis]
[![Dependency Status](http://img.shields.io/gemnasium/wojtekmach/poker.svg)][gemnasium]
[![Code Climate](http://img.shields.io/codeclimate/github/wojtekmach/poker.svg)][codeclimate]
[![Coverage Status](http://img.shields.io/coveralls/wojtekmach/poker.svg)][coveralls]

[gem]: https://rubygems.org/gems/poker
[travis]: https://travis-ci.org/wojtekmach/poker
[gemnasium]: https://gemnasium.com/wojtekmach/poker
[codeclimate]: https://codeclimate.com/github/wojtekmach/poker
[coveralls]: https://coveralls.io/r/wojtekmach/poker

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
