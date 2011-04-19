ENV["RAILS_ENV"] ||= 'test'

require File.expand_path("../dummy/config/environment.rb",  __FILE__)
require 'rspec/rails'

Dir[File.dirname(__FILE__) + '/fabricators/*.rb'].each { |file| require file }

mongoid_file = File.join(File.dirname(__FILE__), "dummy", "config", "mongoid.yml")
@settings = YAML.load(ERB.new(File.new(mongoid_file).read).result)

Mongoid.configure do |config|
  config.from_hash(@settings['test'])
end

RSpec.configure do |config|
  config.mock_with :rspec
    
  config.after :suite do
    Mongoid.master.collections.select do |collection|
      collection.name !~ /system/
    end.each(&:drop)
  end
end