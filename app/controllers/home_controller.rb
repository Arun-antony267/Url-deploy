class HomeController < ApplicationController 
  

def index

  $short_count = ShortUrl.count 
 
end


def urlCount

  @count = ShortUrl.count
  render json:  @count
end


def view   
  @short_url = ShortUrl.all  
  respond_to do |format|
    format.html
    format.pdf do
      pdf = ShortUrlPdf.new(@short_url)
      send_data pdf.render, filename: 'shorturl.pdf', type: 'application/pdfs',disposition: "inline"
      end
    end 

end 

def redirect
@short_url = params[:shortened_url]

if @short_url.present?
   @record = ShortUrl.find_by(shortened_url: @short_url)
   @og_url = @record.original_url
 
else

  @error = "Not entered url"
  render 'index'
end
end

def file 

  $file = params[:filename]
  redirect_to controller: :pdf, action: :read_pdf
 
end


  # def multi_line
  #   $original_url = params[:url]

  #   b = $original_url.chomp('\n')

  # end 
   
   
   
    def check_url
      require 'uri'
      $original_url = params[:url]
      @b = $original_url.chomp('\n')

    if $original_url.present?
      if $original_url =~ /\A#{URI::regexp([ 'http', 'https'])}\z/
        redirect_to :action => 'lookup_code'
      
    else
      @reply = $original_url
      render 'new'
    end
  end
  # end
      # if $original_url =~ /\A#{URI::regexp(['http', 'https','['])}\z/
 
      #       redirect_to :action => 'lookup_code'
      # else
      #   @reply = 'Invalid url' 
      #   render 'new'
      # end
    # end
    end

    def lookup_code
      @display = "https://test.tin.ee/"
      @string = SecureRandom.uuid[0..6]
      $original_url = $original_url
      $shortened_url = @display+@string 
      @reply = 'Valid url'
      redirect_to :action => 'create'
   
    end

    def create

      @Short_url = ShortUrl.new(original_url: $original_url, shortened_url: $shortened_url)
  
      if @Short_url.save
        @original_url = $original_url
        @shortened_url = $shortened_url
        @reply = "created succesfully."
        render 'show'
          
      else
        redirect_to root_path, notice: "!!!!ERROR!!!!"

      end
      
    
    end
    
    
    def show

      @original_url = $original_url
      @shortened_url = $shortened_url
        
    end

    def srtUrl
    
      @shortened_url = $shortened_url
      render json: @shortened_url

    end

  
end