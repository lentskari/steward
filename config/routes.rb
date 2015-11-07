Rails.application.routes.draw do

  root 'welcome#index'

  namespace :api, default: { format: :json },
    constraints: { subdomain: 'api' }, path: '/' do

    resources :customers, :only => [:show, :create] do
      post "uber_access", to: "customers#authenticate_to_uber"
    end
    resources :flights, :only => [:index, :show, :create]
    resources :flight_customers, :only => [:show]

    get 'journeys/:customer_id', to: "journeys#show"
    post 'uber/ride', to: "uber#request_ride"
    get 'uber/ride/:ride_id', to: "uber#show_ride"
  end

end
