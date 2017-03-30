Rails.application.routes.draw do
  namespace :v1 do
    resources :answers
    resources :questions
    resources :reports
    #get 'forms/search/:term'
    resources :forms do
		member do
			get 'getdata'
			
		end
    end
    resources :types
    resources :categories do
		member do
			get 'getforms'
		end
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
