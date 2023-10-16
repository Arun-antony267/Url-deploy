class RedirectController < ApplicationController
    def index
      shortened_url = params[:shortened_url]
       @user = ShortUrl.find_by(shortened_url: shortened_url)
       @rec = @user.id
        redirect_to controller: 'home', action: 'show' 
      # if short_url_record
      #   redirect_to short_url_record.original_url
      # else
      #   render plain: 'Shortened URL not found'
      # end

    end
  end