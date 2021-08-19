# frozen_string_literal: true

require_relative 'lib/stamp_pdf/version'

Gem::Specification.new do |spec|
  spec.name          = 'stamp_pdf'
  spec.version       = StampPdf::VERSION
  spec.authors       = ['Сергеенков Михаил Сергеевич']
  spec.email         = ['sergeenkov.mihail@gmail.com']

  spec.summary       = 'Добавления подписи в pdf документ'
  spec.description   = 'Добавления подписи в pdf документ'
  spec.required_ruby_version = Gem::Requirement.new('>= 3.0.0')

  spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"

  spec.files = Dir['lib/**/*', 'README.md']
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 2.1'
  spec.add_development_dependency 'pdf-reader', '~> 2.5'
  spec.add_development_dependency 'pry'
  spec.add_development_dependency 'rake', '~> 13.0'
  spec.add_development_dependency 'rspec', '~> 3.9'
  spec.add_development_dependency 'rubocop', '~> 0.80'
  spec.add_development_dependency 'simplecov', '~> 0.18'

  spec.add_dependency 'combine_pdf', '~> 1.0'
  spec.add_dependency 'prawn', '~> 2.3'
end
