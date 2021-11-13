Rails.application.routes.draw do
  root 'checks#top'

  namespace :admin do
    root 'cursed_items#index'
    resources :cursed_items, only: %i[new create edit update destroy]
    resources :label_names, only: %i[index new create edit update destroy]
  end
end
