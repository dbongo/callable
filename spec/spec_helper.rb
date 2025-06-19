# frozen_string_literal: true

require "bundler/setup"
require "callable"

RSpec.configure do |config|
  # ------------------------------------------------------------------
  #  Output / filtering niceties
  # ------------------------------------------------------------------
  # Save failing examples and allow `--only-failures`
  config.example_status_persistence_file_path = ".rspec_status"

  # Allow `fit`, `fdescribe`, `fcontext` to focus on a single example group
  config.filter_run_when_matching :focus

  # Print the Ruby version so multi-Ruby CI logs are readable
  config.before(:suite) do
    puts "\n--- Running on Ruby #{RUBY_VERSION} (#{RUBY_PLATFORM}) ---"
  end

  # ------------------------------------------------------------------
  #  RSpec core settings
  # ------------------------------------------------------------------
  # Don’t add DSL methods (`describe`, `it`, etc.) to Object / Module
  config.disable_monkey_patching!

  # Expectation syntax
  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end
