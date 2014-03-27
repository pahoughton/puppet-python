source 'https://rubygems.org'

group :development, :test do
  gem 'bundler'
  gem 'builder','~>3.2.2'
  gem 'puppetlabs_spec_helper', :require => false
  gem 'rspec-system-puppet', '~>2.0'
  gem 'rspec-system-serverspec', '~>1.0'
  gem 'puppet-lint', '~> 0.3.2'
end

if puppetversion = ENV['PUPPET_GEM_VERSION']
  gem 'puppet', puppetversion, :require => false
else
  gem 'puppet', :require => false
end

# vim:ft=ruby
