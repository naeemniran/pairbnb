Rails.application.routes.draw do
  #check rails route to see its RESTful routes

  root 'welcome#index'

  resources :passwords, only: [:create, :new]
  resource :session, only: [:create]

  resources :users, only: [:create, :edit, :update] do
    resource :password,
      only: [:create, :edit, :update]
  end

  get "/sign_in" => "sessions#new", as: "sign_in"
  delete "/sign_out" => "clearance/sessions#destroy", as: "sign_out"
  get "/sign_up" => "clearance/users#new", as: "sign_up"

  get "/auth/:provider/callback" => "sessions#create_from_omniauth"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # get '/a-very-long-url' => 'a#b', as: :something
  # in rails route,will come out as #=> something 		GET    /a-very-long-url(.:format)              a#b



end

