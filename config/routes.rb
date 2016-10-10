Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get  '/shops/search' => 'shops#top'
  post '/shops/search' => 'shops#search'
  resources :shops
  root 'shops#top'


end
