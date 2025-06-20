require 'bundler/gem_tasks'
require 'rspec/core/rake_task'
require 'github_changelog_generator/task'

desc 'Run specs'
RSpec::Core::RakeTask.new(:spec)

GitHubChangelogGenerator::RakeTask.new :changelog do |cfg|
  cfg.user           = 'dbongo'
  cfg.project        = 'callable-mixin'
  cfg.future_release = Callable::VERSION
end

namespace :multi do
  task :spec do
    rubies = %w[
      2.3.8 2.4.10 2.5.9
      2.6.7 2.7.8 3.0.6
      3.1.4 3.2.3 3.3.0 3.4.4
    ]
    rubies.each do |v|
      puts "\n=== Ruby #{v} ==="
      system("RBENV_VERSION=#{v} bundle exec rspec") || abort("Failed on #{v}")
    end
  end
end

task :release => [:spec, :changelog]
