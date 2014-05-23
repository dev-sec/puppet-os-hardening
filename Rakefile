require 'puppetlabs_spec_helper/rake_tasks'

require 'puppet-lint/tasks/puppet-lint'

PuppetLint.configuration.send('disable_autoloader_layout')
PuppetLint.configuration.send('disable_80chars')
PuppetLint.configuration.ignore_paths = ["vendor/**/*.pp"]

task :default => [:lint, :spec]
