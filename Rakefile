#!/usr/bin/env rake
# encoding: utf-8

require 'puppet-lint/tasks/puppet-lint'
require 'puppetlabs_spec_helper/rake_tasks'

PuppetLint.configuration.send('disable_autoloader_layout')
PuppetLint.configuration.send('disable_80chars')
PuppetLint.configuration.fail_on_warnings = true
PuppetLint.configuration.ignore_paths = ['vendor/**/*.pp']

if RUBY_VERSION > '1.9.2'
  require 'rubocop'
  require 'rubocop/rake_task'

  desc 'Run all linters: rubocop and puppet-lint'
  task :run_all_linters => [:rubocop, :lint]

  # Rubocop
  desc 'Run Rubocop lint checks'
  task :rubocop do
    RuboCop::RakeTask.new
  end

  task :default => [:run_all_linters, :spec]

else
  desc 'Run all linters: rubocop and puppet-lint'
  task :run_all_linters => [:lint]

  task :default => [:lint, :spec]
end
