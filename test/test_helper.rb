require 'minitest/autorun'


if ENV['COVERAGE'] == 'true'
  require 'simplecov'
  require 'coveralls'

  SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter[
    SimpleCov::Formatter::HTMLFormatter,
    Coveralls::SimpleCov::Formatter,
  ]

  SimpleCov.start do
    command_name 'test'

    add_filter 'test'
    add_filter 'examples'
    add_filter 'ext'

    minimum_coverage 100
  end
end

require 'poker'
