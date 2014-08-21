Rails.application.routes.draw do
  match('contacts', {:via => :get, :to => 'contacts#index'})
  match('contacts/new', {:via => :get, :to => 'contacts#new'})
  match('contacts', {:via => :post, :to => 'contacts#create'})
  match('contacts/:id', {:via => :get, :to => 'contacts#show'})
end
