source 'https://rubygems.org'

gem 'puppet', '~> 5.3'

group :test do
  gem 'puppet-lint'
  # avoid NoMethodError: private method `clone' called for #<RuboCop::Cop::CopStore:0x00000104e286c8>
  gem 'puppetlabs_spec_helper', :git => 'https://github.com/ehaselwanter/puppetlabs_spec_helper'
  gem 'rake'
  gem 'rspec'
  gem 'rspec-puppet'
  gem 'rubocop', '~> 0.49.0'
end

group :development do
  gem 'guard-rake'
end

group :integration do
  gem 'kitchen-azurerm'
  gem 'kitchen-inspec'
  gem 'kitchen-puppet'
  gem 'kitchen-vagrant'
  gem 'librarian-puppet'
  gem 'test-kitchen', '~> 1.0'
end

group :tools do
  gem 'github_changelog_generator', '~> 1.14'
end
