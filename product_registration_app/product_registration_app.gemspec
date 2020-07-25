lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'automation/app/version'

Gem::Specification.new do |spec|
  spec.name          = 'automation_app'
  spec.version       = Automation::App::VERSION
  spec.authors       = ['Francllin Rios']
  spec.email         = ['ffrdigital@gmail.com']

  spec.summary       = "Testes do app do usuário para o projeto de automação. Versão #{spec.version}."
  spec.description   = "Testes do app do usuário para o projeto de automação. Versão #{spec.version}."
  spec.homepage      = ''
  # TODO: verificar a qual o tipo de licenca
  spec.license       = 'MIT'

  spec.files         = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end

  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_dependency 'appium_console'
  spec.add_dependency 'appium_lib'
  spec.add_dependency 'cucumber', '~> 3'
  spec.add_dependency 'cuke_linter'
  spec.add_dependency 'faker'
  spec.add_dependency 'ffi'
  spec.add_dependency 'json', '~> 1.8'
  spec.add_dependency 'parallel', '~> 1.12'
  spec.add_dependency 'parallel_tests', '~> 2.7', '>= 2.7.1'
  spec.add_dependency 'pry', '~> 0.12.2'
  spec.add_dependency 'rb-readline'
  spec.add_dependency 'report_builder'
  spec.add_dependency 'rspec', '~> 3.0'
  spec.add_dependency 'touch_action'

  spec.add_development_dependency 'bundler'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'rubocop'
  spec.add_development_dependency 'rubocop-checkstyle_formatter'
  spec.add_development_dependency 'rubocop-performance'
end
