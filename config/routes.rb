Rails.application.routes.draw do
  root 'status#index'
  
  namespace :api do
    namespace :v1 do
      get 'senators',     to: 'senators#index'
      get 'senators/:id', to: 'senators#show'
    end
  end
end
