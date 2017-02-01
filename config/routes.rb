Rails.application.routes.draw do
  

  devise_for :users

  authenticated :user do
    root to: 'static_pages#index', as: :authenticated_root
  end

  devise_scope :user do
    root to: "devise/sessions#new"
  end
  
  scope :api do 
    scope :v1 do 
      resources :artists
      resources :users
      resources :events
      resources :venues
    end
  end
end
