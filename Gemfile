source 'https://rubygems.org'

group :development, :test do
  #gem 'bundler'
  #gem 'builder'
  gem 'rake'
  gem 'librarian-puppet'
  gem 'rspec-puppet'
  gem 'puppet-lint'
end

if puppetversion = ENV['PUPPET_GEM_VERSION']
  gem 'puppet', puppetversion, :require => false
else
  gem 'puppet', :require => false
end

# vim:ft=ruby
