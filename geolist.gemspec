# frozen_string_literal: true

lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |spec|
  spec.name          = 'geolist'
  spec.version       = '0.1.0'
  spec.authors       = ['relaxcore']
  spec.email         = ['yuriirogulya@gmail.com']
  spec.summary       = 'Simple list of countries, cities and suburbs of the world'
  spec.description   = 'Useful to make forms and validations. It uses MaxMind database.'
  spec.homepage      = 'https://github.com/relaxcoredev/location'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.7'
  spec.add_development_dependency 'rake', '~> 12.3'

  spec.add_runtime_dependency 'iso_country_codes'
  spec.add_runtime_dependency 'rubyzip', '~> 1.1'
end
