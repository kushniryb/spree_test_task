Rails.application.routes.draw do
  mount Spree::Core::Engine, at: '/'

  Spree::Core::Engine.add_routes do
    namespace :admin, path: Spree.admin_path do
      resources :products do
        post :import, on: :collection
      end
    end
  end
end
