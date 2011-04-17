# C2 - Command & Control

C2 consist of several modules that each provide different ways to take control of your app. The first module is Informant. Informant turns your models into a json store with a pretty web interface based on the amazing webpop.com CMS/Host.

This project is very new and under active development. Watch this project to keep up to date on new features and documentation.

## Install

Add the c2 gem to your gemfile.

    gem 'c2'
    
Run bundler.

    bundle install
    
Tell c2 to inspect models in your app and add them to the C2 - Informant App.

    rake c2:discover
    
To serve static files from your public directory instead of the gem run the c2:install generator.

    rails g c2:install
    
Start taking control of your app by visiting http://yourapp/c2/informant

## Note on Patches/Pull Requests
 
* Fork the project.
* Make your feature addition or bug fix.
* Add tests for it. This is important so I don't break it in a future version unintentionally.
* Commit, do not mess with rakefile, version, or history. (if you want to have your own version, that is fine but bump version in a commit by itself I can ignore when I pull)
* Send me a pull request. Bonus points for topic branches.

## Copyright

Copyright (c) 2009 hexorx. See LICENSE for details.
