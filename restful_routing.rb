    Prefix Verb   URI Pattern               Controller#Action
login_view GET    /login(.:format)          sessions#new
     login POST   /login(.:format)          sessions#create
    logout DELETE /logout(.:format)         sessions#destroy
     users GET    /users(.:format)          users#index
           POST   /users(.:format)          users#create
  new_user GET    /users/new(.:format)      users#new
 edit_user GET    /users/:id/edit(.:format) users#edit
      user GET    /users/:id(.:format)      users#show
           PATCH  /users/:id(.:format)      users#update
           PUT    /users/:id(.:format)      users#update
           DELETE /users/:id(.:format)      users#destroy
      root GET    /                         users#new
