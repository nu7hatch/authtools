# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run the gemspec command
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{authtools}
  s.version = "0.1.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Kris Kowalik"]
  s.date = %q{2010-03-23}
  s.description = %q{Thanks to authtools you can easy generate salted password has
h or unique token and check if specified password string is valid for stored hash...}
  s.email = %q{kriss.kowalik@gmail.com}
  s.extra_rdoc_files = [
    "LICENSE",
     "README.rdoc"
  ]
  s.files = [
    "CHANGELOG",
     "LICENSE",
     "README.rdoc",
     "Rakefile",
     "lib/common.rb",
     "lib/password.rb",
     "lib/token.rb"
  ]
  s.homepage = %q{http://github.com/kriss/authtools}
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.6}
  s.summary = %q{Usefull staff for tokens, passwords and authorization}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end

