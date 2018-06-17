# frozen_string_literal: true

require "rake/testtask"

task default: :test

Rake::TestTask.new(:test) do |task|
  task.libs << "test"
  task.pattern = "test/*_test.rb"
  task.verbose = true
end
