Rails.application.routes.draw do

  root 'welcome#index'

  namespace :api, default: { format: :json },
    constraints: { subdomain: 'api' }, path: '/' do

    resources :customers, :only => [:show] do
      post "uber_access", to: "customers#authenticate_to_uber"
    end
  end

end
