ActionController::Routing::Routes.draw do |map|
  map.resources :jobs
  map.resources :about
  map.logout '/logout', :controller => 'sessions', :action => 'destroy'
  map.login '/login', :controller => 'sessions', :action => 'new'

  map.resource :session

	map.namespace :admin do |admin|
		admin.home 'home', :controller => :home
	end

  map.root :controller => "jobs"
end
