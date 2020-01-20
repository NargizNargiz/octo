Rails.application.routes.draw do
  get 'sttep_description/index'
  get 'sttep_description/show'
  get 'sttep_description/new'
  get 'sttep_description/edit'
  get 'sttep_description/create'
  get 'sttep_description/update'
  get 'sttep_description/destroy'
  resources :step_descriptions
  resources :sttep_descriptions
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
