Rails.application.routes.draw do
  ns_params = {
    defaults: { format: :json },
    path: '',
    as: '',
    constraints: ->(request) { request.params[:version].in?(SUPPORTED_VERSIONS) },
    only: :index
  }

  def latest_version(v)
    ->(request) { request.params[:version] <= v.to_s }
  end

  def first_version(v)
    ->(request) { request.params[:version] >= v.to_s }
  end

  namespace :vv, ns_params do
    scope path: ':version' do
      resources :categories
      resources :users, constraints: first_version(:v2)
      resources :products, constraints: latest_version(:v1)
    end
  end
end
