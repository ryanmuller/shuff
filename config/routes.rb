Shuff::Application.routes.draw do
  resources :categories, :except => [ :new ] do
    resources :links, :only => [ :create, :destroy ] do
      collection do 
        get :shuffle
      end
    end
  end

  root :to => 'categories#index'
end
