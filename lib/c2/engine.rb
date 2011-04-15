module C2
  class Engine < Rails::Engine
    
    rake_tasks do
      load 'c2/tasks.rake'
    end
    
    initializer "static assets" do |app|
      app.middleware.use ::ActionDispatch::Static, "#{root}/public"
    end
  end
end