Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  resources :links do 
    get :show_all_tags, on: :collection
    get :show_link_by_tag_name, on: :collection
  end 
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'links#index'
end
