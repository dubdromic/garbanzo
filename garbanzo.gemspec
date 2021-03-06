lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'garbanzo/version'

Gem::Specification.new do |spec|
  spec.name          = 'garbanzo'
  spec.version       = Garbanzo::VERSION
  spec.authors       = ['Corin Schedler']
  spec.email         = ['corin@dubdromic.com']

  spec.summary       = 'A small library for interacting with Authorize ARB'
  spec.description   = 'A small library for interacting with Authorize ARB'
  spec.homepage      = 'https://github.com/dubdromic/garbanzo'
  spec.license       = 'GPLv2'

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.require_paths = ['lib']

  spec.add_dependency 'active_attr'
  spec.add_dependency 'nokogiri'
  spec.add_dependency 'gyoku', '~> 1.0'
  spec.add_dependency 'faraday'

  spec.add_development_dependency 'bundler', '~> 1.9'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'pry'
  spec.add_development_dependency 'minitest', '~> 5.0'
  spec.add_development_dependency 'minitest-color'
  spec.add_development_dependency 'credit_card_validator'
  spec.add_development_dependency 'webmock'
end
