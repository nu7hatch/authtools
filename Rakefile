# -*- ruby -*-
$:.unshift(File.expand_path('../lib', __FILE__))
require 'authtools/version'
require 'rspec/core/rake_task'
require 'rake/rdoctask'

RSpec::Core::RakeTask.new(:spec) do |t|
  t.pattern = 'spec/**/*_spec.rb'
  t.rspec_opts = %q[-c -b]
end

RSpec::Core::RakeTask.new(:rcov) do |t|
  t.rcov = true
  t.rspec_opts = %q[-c -b]
  t.rcov_opts = %q[-T -x "spec"]
end

Rake::RDocTask.new do |rdoc|
  rdoc.rdoc_dir = 'rdoc'
  rdoc.title = "Authtools #{Authtools.version}"
  rdoc.rdoc_files.include('README*')
  rdoc.rdoc_files.include('lib/**/*.rb')
end

task :default => :spec

desc "Build current version as a rubygem"
task :build do
  `gem build authtools.gemspec`
  `mv authtools-*.gem pkg/`
end

desc "Relase current version to rubygems.org"
task :release => :build do
  `git tag -am "Version bump to #{Authtools.version}" v#{Authtools.version}`
  `git push origin master`
  `git push origin master --tags`
  `gem push pkg/authtools-#{Authtools.version}.gem`
end
