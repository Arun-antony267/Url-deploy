Rails.application.routes.draw do
  devise_for :users

    get 'home/index'
    root 'home#index'
    
    get 'home/new'
     post 'home/check_url'
     post 'home/multi_line'
     get 'home/check_url'
      get 'home/lookup_code'
      get 'shortened_url', to: 'redirect#index'
      post 'home/redirect'
      get 'home/next'
      post 'home/next'
      
     get'/urlCount', to: 'home#urlCount'
     get '/srtUrl', to: 'home#srtUrl'
     get '/ogurl', to: 'home#ogurl'  
     get 'pdf/fileogurl', to: 'pdf#fileOgUrl'
     get 'pdf/filesrturl', to: 'pdf#fileSrtUrl'
     get 'pdf/new_line'

     
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
     get 'pdf/uploadFile'
     get 'pdf/shorten'
     get 'pdf/display'
      
       post 'home/new'
       post 'home/file'
       get 'home/file'
       get 'pdf/index'
       get 'pdf/next_line'
       get'pdf/new'


end
