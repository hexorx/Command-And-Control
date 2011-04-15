if defined?(Rails) && Rails::VERSION::MAJOR == 3
  require 'c2/engine'
  require 'c2/exceptions'
  require 'c2/controller_additions'
end
