# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run 'rake gemspec'
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{c2}
  s.version = "0.1.10"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = [%q{hexorx}]
  s.date = %q{2011-10-31}
  s.description = %q{ C2 aspires to be a simple, drop in, Admin Portal + CMS for apps based on Rails 3 + Mongoid. }
  s.email = %q{hexorx@gmail.com}
  s.extra_rdoc_files = [
    "LICENSE",
    "README.md"
  ]
  s.files = [
    "app/controllers/c2/base_controller.rb",
    "app/controllers/c2/informant/app_controller.rb",
    "app/controllers/c2/informant/buckets_controller.rb",
    "app/controllers/c2/informant/entries_controller.rb",
    "app/controllers/c2/informant/locus_controller.rb",
    "app/controllers/c2/reporter/app_controller.rb",
    "app/models/c2/informant/bucket.rb",
    "app/models/c2/informant/form_element.rb",
    "app/models/c2/informant/locus.rb",
    "app/models/c2/reporter/bucket.rb",
    "app/models/c2/reporter/report.rb",
    "app/stylesheets/c2.scss",
    "app/views/c2/informant/app/_entry_index.html.haml",
    "app/views/c2/informant/app/_entry_index_aside.html.haml",
    "app/views/c2/informant/app/_sidebar.html.haml",
    "app/views/c2/informant/app/show.html.haml",
    "app/views/c2/reporter/app/_sidebar.html.haml",
    "app/views/c2/reporter/app/show.html.haml",
    "app/views/layouts/c2.html.haml",
    "config/initializers/c2_inflections.rb",
    "config/mongoid.yml",
    "config/routes.rb",
    "lib/c2.rb",
    "lib/c2/controller_additions.rb",
    "lib/c2/engine.rb",
    "lib/c2/exceptions.rb",
    "lib/c2/tasks.rake",
    "lib/generators/c2/install_generator.rb",
    "public/images/c2/alert-overlay.png",
    "public/images/c2/back-light.png",
    "public/images/c2/bg-body.png",
    "public/images/c2/bg-header.png",
    "public/images/c2/categories-small.png",
    "public/images/c2/down-arrow.png",
    "public/images/c2/entries-small.png",
    "public/images/c2/external-link.png",
    "public/images/c2/eye.png",
    "public/images/c2/loading.gif",
    "public/images/c2/new-category.png",
    "public/images/c2/new-entry.png",
    "public/images/c2/new-section.png",
    "public/images/c2/ops.png",
    "public/images/c2/trashcan.png",
    "public/javascripts/c2/common.js",
    "public/javascripts/c2/informant/application.js",
    "public/javascripts/c2/informant/collections/buckets.js",
    "public/javascripts/c2/informant/collections/entries.js",
    "public/javascripts/c2/informant/collections/locus.js",
    "public/javascripts/c2/informant/controllers/app.js",
    "public/javascripts/c2/informant/init.js",
    "public/javascripts/c2/informant/models/bucket.js",
    "public/javascripts/c2/informant/models/entry.js",
    "public/javascripts/c2/informant/models/locus.js",
    "public/javascripts/c2/informant/views/entries/edit.js",
    "public/javascripts/c2/informant/views/entries/index.js",
    "public/javascripts/c2/informant/views/notice.js",
    "public/javascripts/c2/informant/views/sidebar.js",
    "public/javascripts/c2/lib/Sexy.min.js",
    "public/javascripts/c2/lib/backbone-min.js",
    "public/javascripts/c2/lib/grid.js",
    "public/javascripts/c2/lib/jquery.Sexy.min.js",
    "public/javascripts/c2/lib/jquery.activity-indicator-1.0.0.min.js",
    "public/javascripts/c2/lib/jquery.ba-dotimeout.min.js",
    "public/javascripts/c2/lib/jquery.dform-0.1.2.min.js",
    "public/javascripts/c2/lib/jquery.min.js",
    "public/javascripts/c2/lib/jquery.timeago.js",
    "public/javascripts/c2/lib/pure_min.js",
    "public/javascripts/c2/lib/underscore.min.js",
    "public/javascripts/c2/reporter_lib.js",
    "public/javascripts/c2/reporter_templates.js",
    "public/javascripts/c2/reporter_vertebrae.js",
    "public/javascripts/c2/vertebrae.js",
    "public/stylesheets/c2.css"
  ]
  s.homepage = %q{http://crackersnack.com/Command-And-Control}
  s.require_paths = [%q{lib}]
  s.rubygems_version = %q{1.8.6}
  s.summary = %q{Take control of your Rails 3 and Mongoid based site with the Comand & Control Admin Portal + CMS.}
  s.test_files = [
    "spec/dummy/app/controllers/application_controller.rb",
    "spec/dummy/app/helpers/application_helper.rb",
    "spec/dummy/app/models/user.rb",
    "spec/dummy/config/application.rb",
    "spec/dummy/config/boot.rb",
    "spec/dummy/config/environment.rb",
    "spec/dummy/config/environments/development.rb",
    "spec/dummy/config/environments/production.rb",
    "spec/dummy/config/environments/test.rb",
    "spec/dummy/config/initializers/backtrace_silencers.rb",
    "spec/dummy/config/initializers/inflections.rb",
    "spec/dummy/config/initializers/mime_types.rb",
    "spec/dummy/config/initializers/secret_token.rb",
    "spec/dummy/config/initializers/session_store.rb",
    "spec/dummy/config/routes.rb",
    "spec/dummy/db/seeds.rb",
    "spec/dummy/test/performance/browsing_test.rb",
    "spec/dummy/test/test_helper.rb",
    "spec/fabricators/locus_fabricator.rb",
    "spec/fabricators/user_fabricator.rb",
    "spec/models/locus_spec.rb",
    "spec/spec_helper.rb"
  ]

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<rails>, [">= 3.0.0"])
      s.add_runtime_dependency(%q<mongoid>, [">= 0"])
      s.add_runtime_dependency(%q<bson_ext>, [">= 0"])
      s.add_runtime_dependency(%q<haml>, [">= 0"])
      s.add_development_dependency(%q<jeweler>, [">= 0"])
      s.add_development_dependency(%q<rspec>, [">= 0"])
    else
      s.add_dependency(%q<rails>, [">= 3.0.0"])
      s.add_dependency(%q<mongoid>, [">= 0"])
      s.add_dependency(%q<bson_ext>, [">= 0"])
      s.add_dependency(%q<haml>, [">= 0"])
      s.add_dependency(%q<jeweler>, [">= 0"])
      s.add_dependency(%q<rspec>, [">= 0"])
    end
  else
    s.add_dependency(%q<rails>, [">= 3.0.0"])
    s.add_dependency(%q<mongoid>, [">= 0"])
    s.add_dependency(%q<bson_ext>, [">= 0"])
    s.add_dependency(%q<haml>, [">= 0"])
    s.add_dependency(%q<jeweler>, [">= 0"])
    s.add_dependency(%q<rspec>, [">= 0"])
  end
end

