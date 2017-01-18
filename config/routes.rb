Rails.application.routes.draw do
	 namespace 'api' do
	    namespace 'v1' do
	    	resources :users
	      	resources :subjects
	      	resources :topics
	    end
  	end
end
