Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'top#index'
  resources :projects, only: [:index, :new, :show, :create ,:edit ,:update ,:destroy] do
    resources :tasks, only: [:new, :create ,:edit ,:update ,:destroy]
  end
end

  # get 'projects' => 'projects#index'
  # get 'projects/new' =>'projects#new'
  # get 'projects/show' =>'projects#show'
  # post 'projects' =>'projects#create'
  # get 'tasks/new' =>'tasks#new'
  # post 'tasks' =>'tasks#create'