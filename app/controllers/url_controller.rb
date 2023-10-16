class UrlController < ApplicationController

  skip_before_action :verify_authenticity_token

def new
  original_url = params[:input]

end

def one
@display = "hello from url controller"
end

end
