Rails.application.routes.draw do
  namespace :admin do
    get 'labelings/index'
    get 'labelings/new'
    get 'labelings/create'
    get 'labelings/edit'
    get 'labelings/update'
    get 'labelings/destroy'
  end
  root 'checks#top'

  namespace :admin do
    root 'cursed_items#index'
    resources :cursed_items, only: %i[new create edit update destroy]
    resources :label_names, only: %i[index new create edit update destroy]
    resources :labelings, only: %i[index new create edit update destroy]
  end
end
