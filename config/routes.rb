Rails.application.routes.draw do
  root 'cursed_items#top'
  post '/result', to: 'cursed_items#result'

  namespace :admin do
    root 'cursed_items#index'
    resources :cursed_items, only: %i[new create edit update destroy]
    resources :label_names, only: %i[index new create edit update destroy]
    resources :labelings, only: %i[index new create edit update destroy]
  end
end
