# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'TarjanSCC/version'

Gem::Specification.new do |spec|
  spec.name          = "TarjanSCC"
  spec.version       = TarjanSCC::VERSION
  spec.authors       = ["Afonso Tsukamoto"]
  spec.email         = ["atsukamoto@faber-ventures.com"]
  spec.summary       = %q{TarjanSCC algorithm}
  spec.description   = %q{TarjanSCC algorithm for a proof of concept for an algorithms course.}
  spec.homepage      = "https://github.com/AfonsoTsukamoto/TarjanSCC"
  spec.license       = "MIT"

  spec.files         = [`git ls-files -z`.split("\x0"),
                        'lib/TarjanSCC.rb',
                        'lib/TarjanSCC/scc.rb',
                        'lib/TarjanSCC/stack.rb',
                        'lib/TarjanSCC/tarjan_executer.rb',
                        'lib/TarjanSCC/vert_array.rb',
                        'lib/TarjanSCC/vertix.rb']
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.5"
  spec.add_development_dependency "rake"
end
