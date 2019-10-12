Rails.application.routes.draw do


  resources :categories
  devise_for :users
  resources :articles do
    resources :comments, only: [:create, :destroy, :update, :show]
  end

=begin
    get "/articles" index
    post "/articles" create
    delete "/articles/:id" delete
    get "/articles/:id" show
    get  "/articles/new" new
    get "/articles/:id*edit" edit
    patch "/articles/:id" update
    put "/articles:id" update
=end
  #get 'special', to: 'welcome#index'
  root 'welcome#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
