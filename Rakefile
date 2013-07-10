require 'bundler/gem_tasks'
require 'rake/testtask'

file "ext/handeval/handeval.o" =>
  Dir.glob("ext/handeval/*{.rb,.c}") do
  Dir.chdir("ext/handeval") do
    ruby "extconf.rb"
    sh "make"
  end
end

Rake::TestTask.new(:test) do |t|
  t.libs << 'lib'
  t.libs << 'test'
  t.pattern = 'test/**/*_test.rb'
  t.verbose = false
end

task :test => "ext/handeval/handeval.o"

task :default => :test
