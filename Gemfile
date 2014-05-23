source 'https://rubygems.org'

group :development, :test do
  gem 'rake'
  gem 'rspec-puppet'
  gem 'puppetlabs_spec_helper'
  gem 'puppet-lint'
#  gem 'guard-rake'
end

if puppetversion = ENV['PUPPET_GEM_VERSION']
  gem 'puppet', puppetversion, :require => false
else
  gem 'puppet', :require => false
end

#group :integration do
#  gem 'test-kitchen'
#  gem 'kitchen-vagrant'
#  gem 'kitchen-puppet', :github => "ehaselwanter/kitchen-puppet", :branch => "repo_is_module"
#  gem 'librarian-puppet'
#  gem 'kitchen-sharedtests', '~> 0.2.0'
#end

# group :openstack do
#   gem 'kitchen-openstack'
# end
