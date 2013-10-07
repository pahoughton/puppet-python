# -*- ruby -*-
require 'rubygems'
require 'bundler/setup'

Bundler.require :default

# edit for push runs travis ci testing

require 'puppetlabs_spec_helper/rake_tasks'
require 'puppet-lint/tasks/puppet-lint'
require 'rspec-system/rake_task'

task :all => :default
task :tdefault => :texclude
task :default => [:test]

PuppetLint.configuration.disable_class_inherits_from_params_class
PuppetLint.configuration.ignore_paths = FileList['**/fixtures/modules/**/**']
# jenkins has a diff build dir name
if (ENV['BUILD_TAG'] && (ENV['BUILD_TAG'].include? "jenkins"))
  PuppetLint.configuration.disable_autoloader_layout
  puts "BUILD_TAG: #{ENV['BUILD_TAG']}"  
end

RSpec::Core::RakeTask.new(:test) do |t|
  t.rspec_opts = ['--format=d',
                  '--out','test.rspec.out']
  t.pattern = 'spec/{classes,defines,unit,functions,hosts}/**/*_spec.rb'
end

RSpec::Core::RakeTask.new(:test_ignore) do |t|
  t.rspec_opts = ['--format=d',
                  '--failure-exit-code=0',
                  '--out','test.rspec.out']
  t.pattern = 'spec/{classes,defines,unit,functions,hosts}/**/*_spec.rb'
end

task :test_ignore => [:lint,:spec_prep] do
end

task :test => [:lint,:spec_prep]

at_exit do
  status= $!.is_a?(::SystemExit) ? $!.status : nil
  if File.exist?('test.rspec.out')
    ofile = File.open('test.rspec.out','r')
    puts ofile.read
  end
  if status
    puts "exiting: #{status}"
    exit status    
  end
end
