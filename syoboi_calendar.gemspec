# -*- encoding: utf-8 -*-
require File.expand_path('../lib/syoboi_calendar/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Ryo NAKAMURA"]
  gem.email         = ["r7kamura@gmail.com"]
  gem.description   = "Simple gem for Syoboi Calendar"
  gem.summary       = "Search Japanese Anime Lineup"
  gem.homepage      = "http://github.com/r7kamura/syoboi_calendar"

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "syoboi_calendar"
  gem.require_paths = ["lib"]
  gem.version       = SyoboiCalendar::VERSION

  gem.add_dependency "mechanize", ">= 2.3"
  gem.add_development_dependency "rake", ">= 0.9.2"
  gem.add_development_dependency "rspec", ">= 2.9.0"
  gem.add_development_dependency "webmock", ">= 1.8.6"
  gem.add_development_dependency "simplecov", ">= 0.6.1"
  gem.add_development_dependency "simplecov-vim", ">= 0.0.1"
end
