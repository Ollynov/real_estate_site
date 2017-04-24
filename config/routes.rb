Rails.application.routes.draw do

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
  resources :homes
  # there are no restrictions for homes. For users, ALL we have is a path of /users/:id (the show path), because
  # that's all we need. While we need ALL of the views for homes /homes/new, homes/:id, etc
  resources :photos
end
