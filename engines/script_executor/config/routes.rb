ScriptExecutor::Engine.routes.draw do
  resources :descriptions
  # get 'steps/new'
  # get 'steps/index'
  # get 'steps/create'
  # get 'steps/show'
  # get "all_scripts_descriptions/edit"
  # get 'script_steps/new'
  # get 'script_steps/index'
  # get 'script_steps/create'
  # get 'script_steps/show'
  # get 'script_steps/add_step'
  #
  resources :exec_scripts
  # do
    # post :run_script, on: :member
    # get :run_script, on: :member
  # end

  resources :scripts, only: %i[index create show] do
    resources :steps, defaults: { format: 'html' }
    post :run_script, on: :member
    post :create_exec_script, on: :member
    get :new_exec_script, on: :member
  end
  get :all, controller: 'steps', defaults: { format: 'html' }
  # resources :script_steps
  # resources :posts, only: %i[index show new create edit update run_script]
  # root 'steps#all'
end
