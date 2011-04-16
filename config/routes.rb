Appi::Application.routes.draw do
  # The priority is based upon order of creation:
  # first created -> highest priority.


  resources :posts do
    member do
      post 'create'
    end

    collection do
      get 'index'
    end
  end
  
  # /api/v1/<request>
  scope 'api' do

    scope 'v2' do
      match 'posts.:format' => 'api/v2/posts#index', via: :get
    end

    ['v1', 'v2'].each do |version|
      scope version do
        match 'posts.:format' => 'api/v1/posts#index', via: :get
        match 'post.:format' => 'api/v1/posts#show', via: :get
        match 'post.:format' => 'api/v1/posts#create', via: :post
      end
    end

  end

  root :to => "posts#index"

end
