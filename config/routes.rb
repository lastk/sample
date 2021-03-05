Rails.application.routes.draw do
  get '/urls/top_100', to: 'urls#top_100'
  resources :urls, only: [:create, :show] do
  end
end
