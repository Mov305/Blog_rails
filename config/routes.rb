Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root to: "users#index"

  resources "users", only: %i[index show] do
    resources "posts", only: %i[index show new create destroy] do
      resources "comments", only: %i[new create destroy]
      resources "likes", only: %i[create destroy]
    end
  end

  namespace :api do
    namespace :v1 do
      resources "users", only: %i[index show] do
        resources "posts", only: %i[index show new create destroy] do
          resources "comments", only: %i[new create destroy]
          resources "likes", only: %i[create destroy]
        end
      end
    end
  end

end
