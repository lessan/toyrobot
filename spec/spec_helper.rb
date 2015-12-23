require 'simplecov'
# Start the code coverage inspector here so any tests that are run
# which include the spec_helper count towards the code that is covered.
SimpleCov.start

RSpec.configure do |config|
  # These two settings work together to allow you to limit a spec run
  # to individual examples or groups you care about by tagging them with
  # `:focus` metadata. When nothing is tagged with `:focus`, all examples
  # get run.
  config.filter_run :focus
  config.run_all_when_everything_filtered = true
end
