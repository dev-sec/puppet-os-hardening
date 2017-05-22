source 'https://rubygems.org'

puppetversion = ENV['PUPPET_VERSION']
if puppetversion
  gem 'puppet', puppetversion, :require => false
else
  gem 'puppet', :require => false # rubocop:disable Bundler/DuplicatedGem
end

group :test do
  gem 'puppet-lint'
  # avoid NoMethodError: private method `clone' called for #<RuboCop::Cop::CopStore:0x00000104e286c8>
  gem 'puppetlabs_spec_helper', :git => 'https://github.com/ehaselwanter/puppetlabs_spec_helper'
  gem 'rake'
  gem 'rspec'
  gem 'rspec-puppet'
  gem 'rubocop'
end

group :development do
  gem 'guard-rake'
end

group :integration do
  gem 'kitchen-puppet'
  gem 'kitchen-sharedtests', '~> 0.2.0'
  gem 'kitchen-vagrant'
  gem 'librarian-puppet'
  gem 'test-kitchen'
end
