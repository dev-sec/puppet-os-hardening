#!/usr/bin/env rake

require 'puppetlabs_spec_helper/rake_tasks'

require 'puppet-lint/tasks/puppet-lint'
require 'rubocop/rake_task'

PuppetLint.configuration.send('disable_autoloader_layout')
PuppetLint.configuration.send('disable_80chars')
PuppetLint.configuration.fail_on_warnings = true
PuppetLint.configuration.ignore_paths = ["vendor/**/*.pp"]

task :default => [:lint, :spec]

# Lint the cookbook
desc "Run all linters: rubocop and foodcritic"
task :run_all_linters => [ :rubocop, :lint ]

# Rubocop
desc 'Run Rubocop lint checks'
task :rubocop do
  Rubocop::RakeTask.new
end


