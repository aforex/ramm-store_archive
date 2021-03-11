require 'rubygems' unless defined?(Gem)
require 'bundler/setup'

require_relative 'application'

# require_relative '../lib/active_support'
# require_relative '../lib/constants'

Bundler.require(:default, Application.env)

loader = Zeitwerk::Loader.new
loader.preload 'config/initializers'
# loader.preload 'lib/mixins/repo'

loader.push_dir 'app'
loader.setup
loader.eager_load
