Rails.application.routes.draw do

    get 'home/index'
    root 'home#index'
    
    get 'home/new'
     post 'home/check_url'
      get 'home/lookup_code'
      get 'shortened_url', to: 'redirect#index'
      post 'home/redirect'
      
     get'/urlCount', to: 'home#urlCount'
     get '/srtUrl', to: 'home#srtUrl'
     get '/ogurl', to: 'home#ogurl'   

      post 'home/lookup_code'
      get 'home/view'
      get 'user/users'
      get 'home/multi_line'
      get 'home/create'
     get 'home/show'
     get '/user/signup'
     post '/user/signup'
     post '/user/create'
     get '/user/login'
     post '/user/login'
     post 'user/check_login'
     get 'user/check_login'
      
       post 'home/new'
       post 'home/file'
       get 'home/file'
       get 'pdf/index'
       post 'pdf/upload'

end
