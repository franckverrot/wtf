# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "wtf/version"

Gem::Specification.new do |s|
  s.name        = "wtf"
  s.version     = Wtf::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Franck Verrot", "Richard K. Michael"]
  s.email       = ["franck@verrot.fr"]
  s.homepage    = "http://github.com/cesario/wtf"
  s.summary     = %q{DSL configurable DVCS workflow}
  s.description = %q{wtf makes it very easy to define your own workflow and tools (SCM, ticket manager, ...)}

  s.rubyforge_project = "wtf"

  s.add_dependency 'activesupport'
  s.add_dependency 'i18n'

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end
