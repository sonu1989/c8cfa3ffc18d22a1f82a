Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :phones, only: [:index, :create]
      post '/phones/:phone_number' => 'phones#allot_by_number'
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
