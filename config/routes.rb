Rails.application.routes.draw do
  namespace :admin do
    get 'object_names/index'
    get 'object_names/new'
    get 'object_names/create'
    get 'object_names/edit'
    get 'object_names/update'
    get 'object_names/destroy'
  end
  namespace :admin do
    get 'cursed_items/index'
    get 'cursed_items/new'
    get 'cursed_items/edit'
  end
  root 'checks#top'

  namespace :admin do
    root 'cursed_items#index'
    resources :cursed_items, only: %i[new create edit update destroy]
    resources :object_names, only: %i[index new create edit update destroy]
  end
end
