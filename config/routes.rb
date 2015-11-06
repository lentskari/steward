Rails.application.routes.draw do

  root 'welcome#index'

  namespace :api, default: { format: :json },
    constraints: { subdomain: 'api' }, path: '/' do
    # rest resources
  end

end
