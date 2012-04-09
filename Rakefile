#!/usr/bin/env rake

require "bundler/gem_tasks"

begin
  require "bundler"
rescue LoadError
  $stderr.puts e.message
  $stderr.puts "Run `gem install bundler` to install bundler"
  exit e.status_code
end

begin
  Bundler.setup(:default, :development)
rescue Bundler::BundlerError => e
  $stderr.puts e.message
  $stderr.puts "Run `bundle install` to install missing gems"
  exit e.status_code
end

require "rspec/core"
require "rspec/core/rake_task"

RSpec::Core::RakeTask.new(:spec)

task :default => :spec
