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
    config.future_release = '2.1.0'
    config.since_tag = '1.1.1'
    config.user = 'dev-sec'
    config.project = 'puppet-os-hardening'
    config.exclude_labels = ['no changelog','invalid']
  end

else
  desc 'Run all linters: rubocop and puppet-lint'
  task :run_all_linters => [:lint]

  task :default => [:lint, :spec]
end

# rubocop:enable Style/SymbolArray

desc 'Run kitchen integration tests'
task :kitchen do
  concurrency = ENV['CONCURRENCY'] || 1
  instance = ENV['INSTANCE'] || ''
  args = ENV['CI'] ? '--destroy=always' : ''
  sh('sh', '-c', "bundle exec kitchen test -c #{concurrency} #{args} #{instance}")
end

desc 'Prepare CI environment for Azure usage'
task :prepare_do_env do
  SSH_KEY_FILE = '~/.ssh/ci_id_rsa'.freeze
  ENV_VAR_NAME = 'CI_SSH_KEY'.freeze

  ['DIGITALOCEAN_ACCESS_TOKEN', 'DIGITALOCEAN_SSH_KEY_IDS', ENV_VAR_NAME].each do |var|
    raise "Environment variable #{var} should be set" unless ENV[var]
  end

  ssh_file = File.expand_path(SSH_KEY_FILE)
  dir = File.dirname(ssh_file)
  Dir.mkdir(dir, 0o700) unless Dir.exist?(dir)
  File.open(ssh_file, 'w') { |f| f.puts Base64.decode64(ENV[ENV_VAR_NAME]) }
  File.chmod(0o600, ssh_file)
end
