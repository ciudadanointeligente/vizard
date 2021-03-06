Rails.application.routes.draw do
  root to: 'visitors#index'

  resources :actors do
    get 'actor_type', on: :collection
    get 'actor_support', on: :collection
    get 'actor_influence_level', on: :collection
  end

  get 'solutions/aside', to: 'solutions#aside'
  get 'solutions/aside_form', to: 'solutions#aside_form'
  get 'solutions/list', to: 'solutions#list'
  get 'real_problems/focus_area', to: 'real_problems#focus_area'

  resources :real_problems do
    resources :policy_problems do
      resources :solutions do
      end
    end
  end

  get 'outcomes/categories', to: 'outcomes#categories'

  resources :projects do
    get 'overview', on: :member
    get 'solutions', on: :member
    get 'stage1', on: :member
    get 'stage2', on: :member
    post 'share', on: :member
    resources :objectives do
      get 'stage3', on: :member
      get 'stage4', on: :member
      get 'stage5', on: :member
      get 'stage6', on: :member
      get 'actors', on: :member
      get 'generate_massive_ical', on: :member
      get 'objective_types', on: :collection
      resources :outcomes
      resources :asks
      resources :activities do
        get 'generate_ical', on: :member
      end
    end
    resources :resources do
      get 'aside', on: :collection
      get 'aside', on: :member
    end
  end

  resources :activities, only: [:show] do
    resources :indicators
  end

  devise_for :users, :controllers => {:registrations => "registrations"}
  resources :people
  resources :other_names
  resources :sandboxes do
    get 'clone', on: :member
    get 'export', on: :member
  end
  get '/javascript_test/:script' => 'javascript_test#render_test', :as => 'javascript_test'

  get '/models', to: 'visitors#models'

  resources :demo do
    get 'stage1', on: :member
  end
end
