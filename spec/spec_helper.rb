$LOAD_PATH.unshift(File.dirname(__FILE__))
$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))

require 'bundler'
require 'c2'

Bundler.require(:default, :test) if defined?(Bundler)

mongoid_file = File.join(File.dirname(__FILE__), "..", "config", "mongoid.yml")
@settings = YAML.load(ERB.new(File.new(mongoid_file).read).result)

Mongoid.configure do |config|
  config.from_hash(@settings['test'])
end

RSpec.configure do |config|
  config.include Devise::TestHelpers, :type => :controller
  config.mock_with :rspec
    
  config.after :suite do
    Mongoid.master.collections.select do |collection|
      collection.name !~ /system/
    end.each(&:drop)
  end
end
