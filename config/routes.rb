ActionController::Routing::Routes.draw do |map|
  map.resources :posts

  map.root :controller => 'sessions', :action => 'new'

  map.forgot_password '/forgot_password', :controller => 'passwords', :action => 'new'
  map.change_password '/change_password/:reset_code', :controller => 'passwords', :action => 'reset'
  map.resources :passwords

  map.activate '/activate/:activation_code', :controller => 'users', :action => 'activate', :activation_code => nil

  map.logout '/logout', :controller => 'sessions', :action => 'destroy'
  map.login '/login', :controller => 'sessions', :action => 'new'
  map.register '/register', :controller => 'users', :action => 'create'
  map.signup '/signup', :controller => 'users', :action => 'new'
  map.resources :users

  map.resource :session

 
end
