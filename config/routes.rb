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
  
  scope 'api' do

    scope 'v1' do
      match 'posts.:format' => 'api/v1/posts#index', via: :get
      match 'post.:format' => 'api/v1/posts#show', via: :get
      match 'post.:format' => 'api/v1/posts#create', via: :post
    end

  end

  root :to => "posts#index"

end
