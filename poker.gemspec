# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "poker/version"

Gem::Specification.new do |s|
  s.name        = "poker"
  s.version     = Poker::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Wojciech Mach"]
  s.email       = ["wojtekmach1@gmail.com"]
  s.homepage    = "http://rubygems.org/gems/poker"
  s.summary     = %q{Poker hand evaluator}
  s.description = %q{Poker hand evaluator}

  s.rubyforge_project = "poker"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib", "ext"]
  s.extensions = ["ext/handeval/extconf.rb"]

  s.add_development_dependency 'rake'
  s.add_development_dependency 'minitest', '~> 5.0'
  s.add_development_dependency 'coveralls'
  s.add_development_dependency 'simplecov'
end
