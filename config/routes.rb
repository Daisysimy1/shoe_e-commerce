Rails.application.routes.draw do
  post 'auth/register', to: 'authentication#create_account'
end
