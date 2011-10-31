Rails.application.routes.draw do
  namespace :c2 do
    namespace :informant do
      get '/', :to => 'app#show', :as => :app
      resources :locus, :only => [:index, :create, :update] do
        resources :entries
        resources :buckets do
          resources :entries
        end
      end
    end
    namespace :reporter do
      get '/', :to => 'app#show', :as => :app
    end
  end
end