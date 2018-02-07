Rails.application.routes.draw do
  ns_params = {
    defaults: { format: :json },
    path: '',
    as: '',
    constraints: ->(request) { request.params[:version] == 'v1' },
    only: :index
  }

  namespace :vv, ns_params do
    scope path: ':version' do
      resources :categories
      resources :users
    end
  end
end
