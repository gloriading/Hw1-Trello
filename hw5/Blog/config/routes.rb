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
  end
#----------------------------------------------------
  get('/', to: 'welcome#index', as: :home)
#----------------------------------------------------
  resources :users, only: [:new, :create, :update, :edit]
  # resources :users do
  #   get :edit_password
  #   update :update_password
  # end
  get('/users/:id/edit_password', to: 'users#edit_password',as: :edit_password)
  patch('/users/:id', to: 'users#update_password')
# ----------------------------------------------------
  resource :session, only: [:new, :create, :destroy]
#----------------------------------------------------
  namespace :admin do
    resources :dashboard, only: [:index]
  end
#----------------------------------------------------

end
