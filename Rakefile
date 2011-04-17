require 'rubygems'
require 'rake'

begin
  require 'jeweler'
  Jeweler::Tasks.new do |gem|
    gem.name = "c2"
    gem.summary = %Q{ Take control of your Rails 3 and Mongoid based site with the Comand & Control Admin Portal + CMS. }
    gem.description = %Q{ C2 aspires to be a simple, drop in, Admin Portal + CMS for apps based on Rails 3 + Mongoid. }
    gem.files = Dir["{lib}/**/*", "{app}/**/*", "{config}/**/*", "{public}/**/*"]
    gem.email = "hexorx@gmail.com"
    gem.homepage = "http://crackersnack.com/Command-And-Control"
    gem.authors = ["hexorx"]    
  end
  Jeweler::GemcutterTasks.new
rescue LoadError
  puts "Jeweler (or a dependency) not available. Install it with: sudo gem install jeweler"
end

require 'rspec/core/rake_task'

RSpec::Core::RakeTask.new(:spec)

task :default => :spec