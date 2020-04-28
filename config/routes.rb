Rails.application.routes.draw do
  	get 'steps/new'
  	get 'steps/index'
  	get 'steps/create'
  	get 'steps/show'
    get "all_scripts_descriptions/edit"
	  get 'script_steps/new'
  	get 'script_steps/index'
  	get 'script_steps/create'
  	get 'script_steps/show'
    get "script_steps/add_step"
	resources :all_scripts_descriptions
	resources :exec_scripts
	resources :script_steps
	resources :steps
  resources :posts, only: [:index, :show, :new, :create, :edit, :update]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
