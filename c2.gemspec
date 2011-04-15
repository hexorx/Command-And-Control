# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run 'rake gemspec'
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{c2}
  s.version = "0.0.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["hexorx"]
  s.date = %q{2011-04-08}
  s.description = %q{ C2 aspires to be a simple, drop in, Admin Portal + CMS for apps based on Rails 3 + Mongoid. }
  s.email = %q{hexorx@gmail.com}
  s.extra_rdoc_files = [
    "LICENSE",
    "README.md"
  ]
  s.files = [
    "app/controllers/c2/base_controller.rb",
    "app/controllers/c2/informant/app_controller.rb",
    "app/controllers/c2/informant/locus_controller.rb",
    "app/models/c2/informant/locus.rb",
    "app/views/c2/informant/app/_index.html.haml",
    "app/views/c2/informant/app/show.html.haml",
    "app/views/layouts/c2.html.haml",
    "config/mongoid.yml",
    "config/routes.rb",
    "lib/c2.rb",
    "lib/c2/engine.rb"
  ]
  s.homepage = %q{http://github.com/hexorx/c2}
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.6.2}
  s.summary = %q{Take control of your Rails 3 and Mongoid based site with the Comand & Control Admin Portal + CMS.}
  s.test_files = [
    "spec/c2_spec.rb",
    "spec/spec_helper.rb"
  ]

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<rails>, [">= 3.0.0"])
      s.add_runtime_dependency(%q<mongoid>, ["= 2.0.0.rc.7"])
      s.add_runtime_dependency(%q<bson_ext>, ["= 1.2.4"])
      s.add_development_dependency(%q<jeweler>, [">= 0"])
      s.add_development_dependency(%q<rspec>, [">= 0"])
      s.add_development_dependency(%q<rspec>, [">= 0"])
    else
      s.add_dependency(%q<rails>, [">= 3.0.0"])
      s.add_dependency(%q<mongoid>, ["= 2.0.0.rc.7"])
      s.add_dependency(%q<bson_ext>, ["= 1.2.4"])
      s.add_dependency(%q<jeweler>, [">= 0"])
      s.add_dependency(%q<rspec>, [">= 0"])
      s.add_dependency(%q<rspec>, [">= 0"])
    end
  else
    s.add_dependency(%q<rails>, [">= 3.0.0"])
    s.add_dependency(%q<mongoid>, ["= 2.0.0.rc.7"])
    s.add_dependency(%q<bson_ext>, ["= 1.2.4"])
    s.add_dependency(%q<jeweler>, [">= 0"])
    s.add_dependency(%q<rspec>, [">= 0"])
    s.add_dependency(%q<rspec>, [">= 0"])
  end
end
