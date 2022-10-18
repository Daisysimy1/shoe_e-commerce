Rails.application.routes.draw do
  #authentication
  post 'auth/register', to: 'authentication#create_account'
  post 'auth/login', to: 'authentication#login_account'
  delete 'auth/logout', to: 'authentication#logout_account'

  #shoes
  post 'shoes/create', to: 'kiatus#create_shoe'
end
