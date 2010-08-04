require 'rubygems'
require 'rake'

begin
  require 'jeweler'
  Jeweler::Tasks.new do |gemspec|
    gemspec.name = "authtools"
    gemspec.summary = "Usefull staff for tokens, passwords and authorization"
    gemspec.description = "Thanks to authtools you can easy generate salted password has
h or unique token and check if specified password string is valid for stored hash..."
    gemspec.email = "kriss.kowalik@gmail.com"
    gemspec.homepage = "http://github.com/kriss/authtools"
    gemspec.authors = ["Kris Kowalik"]
  end
rescue LoadError
  puts "Jeweler not available. Install it with: gem install jeweler"
end

require 'spec/rake/spectask'
Spec::Rake::SpecTask.new(:spec) do |spec|
  spec.libs << 'lib' << 'spec'
  spec.spec_files = FileList['spec/**/*_spec.rb']
end

Spec::Rake::SpecTask.new(:rcov) do |spec|
  spec.libs << 'lib' << 'spec'
  spec.pattern = 'spec/**/*_spec.rb'
  spec.rcov = true
end

task :spec => :check_dependencies

task :default => :spec

require 'rake/rdoctask'
Rake::RDocTask.new do |rdoc|
  version = File.exist?('VERSION') ? File.read('VERSION') : ""

  rdoc.rdoc_dir = 'rdoc'
  rdoc.title = "authtools2 #{version}"
  rdoc.rdoc_files.include('README*')
  rdoc.rdoc_files.include('lib/**/*.rb')
end
