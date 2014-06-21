#!/usr/bin/env rake

require 'puppetlabs_spec_helper/rake_tasks'
require 'puppet-lint/tasks/puppet-lint'

if RUBY_VERSION > "1.9.3"

  require 'rubocop/rake_task' 

  # Lint the cookbook
  desc "Run all linters: rubocop and foodcritic"
  task :run_all_linters => [ :rubocop, :lint ]

  # Rubocop
  desc 'Run Rubocop lint checks'
  task :rubocop do
    Rubocop::RakeTask.new
  end
  task :default => [:run_all_linters, :spec]

else
  task :default => [:lint, :spec]
end

PuppetLint.configuration.send('disable_autoloader_layout')
PuppetLint.configuration.send('disable_80chars')
PuppetLint.configuration.fail_on_warnings = true
PuppetLint.configuration.ignore_paths = ["vendor/**/*.pp"]



