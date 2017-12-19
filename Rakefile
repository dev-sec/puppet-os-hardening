# rubocop:disable Style/SymbolArray

require 'puppet-lint/tasks/puppet-lint'
require 'puppetlabs_spec_helper/rake_tasks'
require 'github_changelog_generator/task'

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

  # Changelog Generator
  GitHubChangelogGenerator::RakeTask.new :changelog do |config|
    config.future_release = '2.0.0'
    config.since_tag = '1.1.1'
    config.user = 'dev-sec'
    config.project = 'puppet-os-hardening'
  end

else
  desc 'Run all linters: rubocop and puppet-lint'
  task :run_all_linters => [:lint]

  task :default => [:lint, :spec]
end

# rubocop:enable Style/SymbolArray
