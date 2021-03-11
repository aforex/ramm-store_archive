# frozen_string_literal: true

require 'rspec'

ENV['RACK_ENV'] = 'test'

require_relative '../config/boot'
# require Application.root + '/spec/shared/validator'

Dir['./spec/support/**/*.rb'].sort.each { |file| require file }
Dir['./spec/factories/**/*.rb'].sort.each { |file| require file }
Dir['./spec/shared/**/*.rb'].sort.each { |file| require file }

RSpec.configure do |config|
  config.raise_errors_for_deprecations!
  config.order = :random

  # config.filter_run_when_matching :focus
  # config.example_status_persistence_file_path = 'tmp/examples.txt'
end
