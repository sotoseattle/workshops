require "rake"
require "rake/testtask"

require "bundler"
Bundler.setup(:default)
require "conway_gol"

Rake::TestTask.new do |t|
  t.libs << "test"
  t.test_files = FileList["test/**/*_test.rb"]
  t.verbose = true
end

task :start do
  ruby "bin/conway_gol"
end

task default: :start
