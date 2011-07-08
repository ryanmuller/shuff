Shuff::Application.routes.draw do
  resources :categories, :except => [ :new ] do
    resources :links, :only => [ :create, :destroy ] do
      collection do 
        get :shuffle
      end
    end
  end

  match "/shuffle/:category_id" => "links#shuffle"
  root :to => 'categories#index'
end
