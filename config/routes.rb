Rails.application.routes.draw do

  root 'homes#top'

  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks',
  }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


  resources :users, only: [:index, :edit, :update]

  resources :tasks, except: [:show]

  resources :notifications, only: [:index]



  post '/tasks/:id/done' => 'tasks#done', as: 'done'
  resources :events
end
