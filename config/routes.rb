Rails.application.routes.draw do
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks'
  }, skip: [:sessions, :registration, :passwords]

  as :user do
    delete '/users/sign_out', to: 'devise/sessions#destroy', as: :destroy_user_session
  end
  # destroy_user_session DELETE   /users/sign_out(.:format)                                                                                                                                               devise/sessions#destroy


  resources :courses, except: [:edit, :destroy], param: :code do
    resources :reviews do
      member do
        put 'like',    to: 'reviews#upvote'
        put 'dislike', to: 'reviews#downvote'
      end
    end
    get 'recent_reviews'
    get 'popular_reviews'
    get :autocomplete_course_code_title_instructor, on: :collection
  end

  # You can have the root of your site routed with "root"
  root 'welcome#index'

  get '/contact', to: 'welcome#contact'

end
