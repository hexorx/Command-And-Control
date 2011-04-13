Rails.application.routes.draw do |map|
  namespace :c2 do
    namespace :informant do
      get '/', :to => 'app#show', :as => :app
      resources :locus, :only => [:index, :create, :update] do
        resources :buckets do
          resources :entries
        end
      end
    end
  end
end