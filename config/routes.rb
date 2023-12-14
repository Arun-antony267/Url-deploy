Rails.application.routes.draw do
  get "home/index"
  get "/i", to: "home#redirect_to_original"
  root "user#login"

  get "home/new"
  post "home/check_url"
  post "home/multi_line"
  get "home/check_url"
  get "home/lookup_code"
  get "shortened_url", to: "redirect#index"
  post "home/redirect"
  get "home/next"
  post "home/next"

  get "/urlCount", to: "home#urlCount"
  get "/srtUrl", to: "home#srtUrl"
  get "/ogurl", to: "home#ogurl"
  get "file/new_line"

  post "home/lookup_code"
  get "home/view"
  get "user/users"
  get "home/multi_line"
  get "home/create"
  get "home/show"
  get "/user/signup"
  post "/user/signup"
  post "/user/create"
  get "/user/login"
  post "/user/login"
  post "user/check_login"
  get "user/check_login"
  get "file/uploadFile"
  get "file/shorten"
  get "file/display"

  post "home/new"
  post "home/file"
  get "home/file"
  get "file/next_line"
  get "/redirect", to: "webhook#redirect"

  get "/home/loading", to: "file#full"

  get "/user/forgot"
  post "user/reset_password"
end
