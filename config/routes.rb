Rails.application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'
  devise_for :users,
             controllers: { sessions: 'users/sessions', passwords: 'users/passwords' },
             path: 'users',
             path_names: { sign_in:      'login',
                           sign_up:      'new',
                           sign_out:     'logout',
                           password:     'password'}
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'home#index'

  namespace :admin do
    resources :categories do
      member do
        get 'load_subcategories'
      end
    end
    resources :subcategories do
      member do
        get 'load_brands'
      end
    end
    resources :brands
    resources :products
    resources :static_pages
    resources :tags
    resources :social_pages
  end

  resources :products, only: [:show] do
    collection do
      get 'search_by_tag'
      get 'search_by_brand'
      get 'render_video'
    end
  end

  resources :pages , only: [:show]

  resources :home do
    collection do
      get 'top_most_viewed'
      get 'search_product'
    end
  end
end
