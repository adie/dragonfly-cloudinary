# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'dragonfly-cloudinary/version'

Gem::Specification.new do |gem|
  gem.name          = "dragonfly-cloudinary"
  gem.version       = Dragonfly::Cloudinary::VERSION
  gem.authors       = ["Anton Dieterle"]
  gem.email         = ["antondie@gmail.com"]
  gem.description   = %q{Simple cloudinary data store for Dragonfly}
  gem.summary       = %q{Simple cloudinary data store for Dragonfly}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_dependency 'rake', '>= 0.9'
  gem.add_dependency 'dragonfly', '>= 0.9'
  gem.add_dependency 'cloudinary', '>= 1.0'
end
