Rails.application.routes.draw do

  get 'houses/index'

  get 'houses/show'

  get 'houses/new'

  get 'houses/create'

  get 'houses/edit'

  get 'houses/update'

  root 'pages#home'

  devise_for :users,
             :path => '',
             :path_names => {:sign_in => 'login', :sign_out => 'logout', :edit => 'profile'},
             :controllers => {:omniauth_callbacks => 'omniauth_callbacks',
                              # Any time you create a custom controller that over writes a devise controller,
                              # then it needs to be declared here.
                              :registrations => 'registrations'
                            }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :users, only: [:show]
end
