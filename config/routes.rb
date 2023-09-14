Rails.application.routes.draw do
  root to: 'items#index'
  get 'items/new', to: 'items#new', as: 'new_item'
  get 'items', to: 'items#index', as: 'items'
  resources :items, except: [:edit]  # :editアクション以外のルートを生成
get 'items/:id/edit', to: 'items#edit', as: 'edit_item' 
  resources :items
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

   #Defines the root path route ("/")
   #root "articles#index"
end
