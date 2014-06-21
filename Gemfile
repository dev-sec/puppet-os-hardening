source 'https://rubygems.org'

if puppetversion = ENV['PUPPET_VERSION']
  gem 'puppet', puppetversion, :require => false
else
  gem 'puppet', :require => false
end

group :test do
  gem 'rake'
  gem 'rspec-puppet'
  # avoid NoMethodError: private method `clone' called for #<RuboCop::Cop::CopStore:0x00000104e286c8>
  gem 'puppetlabs_spec_helper', :git => "https://github.com/ehaselwanter/puppetlabs_spec_helper"
  gem 'puppet-lint'
  gem 'rubocop',    '~> 0.23' if RUBY_VERSION > "1.9.2"
end

group :development do
  gem 'guard-rake'
end

group :integration do
  gem 'test-kitchen'
  gem 'kitchen-vagrant'
  gem 'kitchen-puppet', '~> 0.0.11'
  gem 'librarian-puppet'
  gem 'kitchen-sharedtests', '~> 0.2.0'
end

group :openstack do
  gem 'kitchen-openstack'
end
