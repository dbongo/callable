require "bundler/gem_tasks"
require "rspec/core/rake_task"

desc "Run specs"
RSpec::Core::RakeTask.new(:spec)

# Run the suite under every Ruby installed via rbenv/rvm
namespace :multi do
  task :spec do
    rubies = %w[
      2.1.9 2.2.10 2.3.8 2.4.10 2.5.9
      2.6.7 2.7.8 3.0.6 3.1.4 3.2.3 3.3.0
    ]
    rubies.each do |v|
      puts "\n=== Ruby #{v} ==="
      bundler = v < "2.3" ? "1.17.3" : "2"
      cmd = "RBENV_VERSION=#{v} bundle _#{bundler}_ exec rspec"
      system(cmd) || abort("Failed on #{v}")
    end
  end
end
