Rails.application.routes.draw do
  namespace :v1 do
    resources :answers, only: []
    resources :questions, only: []
    resources :reports, only: [:create]
    resources :forms do
		member do
			get 'getdata'
			get 'getreports'	
		end
    end
    resources :types, only: []
    resources :categories do
		member do
			get 'getforms'
		end
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
