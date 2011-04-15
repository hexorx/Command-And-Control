class C2::InstallGenerator < Rails::Generators::Base
  source_root File.expand_path('../../../../', __FILE__)
  desc "Configure your app to work with C2."

  def cache_js
    directory "public/javascripts/c2", "public/javascripts/c2"
  end  

  def cache_css
    copy_file "public/stylesheets/c2.css", "public/stylesheets/c2.css"
  end

  def cache_images
    directory "public/images/c2", "public/images/c2"
  end
end