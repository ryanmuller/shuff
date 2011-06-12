Shuff::Application.routes.draw do
  resources :categories do
    resources :links do
      collection do 
        get :shuffle
      end
    end
  end

  root :to => 'categories#index'
end
