Rails.application.routes.draw do
  # get('/posts/new', to: 'posts#new', as: :new_post)
  # post('/posts/', to: 'posts#create', as: :posts)
  #
  # get('/posts/', to: 'posts#index')
  # get('/posts/:id', to: 'posts#show', as: :post)
  #
  # get('/posts/:id/edit', to: 'posts#edit', as: :edit_post)
  # patch('/posts/:id', to: 'posts#update')
  #
  # delete('/posts/:id', to: 'posts#destroy')


  resources :posts do
    resources :comments, only: [:create, :destroy]
    collection do
      get :search
    end
  end
#----------------------------------------------------
  get('/', to: 'welcome#index', as: :home)
#----------------------------------------------------
  resources :users do
      collection do # use `collection` when add new methods to the existing route
          get :edit_password
          patch :update_password
      end
  end

  # resources :users, only: [:new, :create, :update, :edit]
  # get('/users/:id/edit_password', to: 'users#edit_password',as: :edit_password)
  # patch('/users/:id', to: 'users#update_password')

# ----------------------------------------------------
  resource :session, only: [:new, :create, :destroy]
#----------------------------------------------------
  namespace :admin do
    resources :dashboard, only: [:index]
  end
#----------------------------------------------------
  resources :password_resets, only: [ :new, :create]
  get '/password_resets/edit' => 'password_resets#edit', as: :edit_password_reset
  put '/password_resets/' => 'password_resets#update', as: :password_reset
end
