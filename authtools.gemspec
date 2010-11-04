# -*- ruby -*-
$:.unshift(File.expand_path('../lib', __FILE__))
require 'authtools/version'

Gem::Specification.new do |s|
  s.name             = 'authtools'
  s.version          = Authtools.version
  s.homepage         = 'http://github.com/nu7hatch/authtools'
  s.email            = ['chris@nu7hat.ch']
  s.authors          = ['Chris Kowalik']
  s.summary          = %q{Usefull stuff for unique tokens and secured password hashes generation.}
  s.description      = %q{Thanks to authtools you can easy generate salted password hash, validate it or generate unique token...}
  s.files            = `git ls-files`.split("\n")
  s.test_files       = `git ls-files -- {spec}/*`.split("\n")
  s.require_paths    = %w[lib]
  s.extra_rdoc_files = %w[README.rdoc]
end
