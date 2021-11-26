Rails.application.routes.draw do
  root 'cursed_items#top'
  get '/index', to: 'cursed_items#index'
  get '/result', to: 'cursed_items#result'
  post '/result', to: 'cursed_items#result'
  get '/apology', to: 'cursed_items#apology'

  namespace :admin do
    root 'cursed_items#index'
    resources :cursed_items, only: %i[new create edit update destroy]
    resources :label_names, only: %i[index new create edit update destroy]
    resources :labelings, only: %i[index new create edit update destroy]
  end
end
