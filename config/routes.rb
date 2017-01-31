Rails.application.routes.draw do
  root 'static_pages#index'

  devise_for :users
  
  scope :api do 
    scope :v1 do 
      resources :artists
      resources :users
      resources :events
      resources :venues
    end
  end
end
