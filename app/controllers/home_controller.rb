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

def is_csv_file?(file_path)
  # Use File.extname to get the extension of the file
  extension = File.extname(file_path)

  # Check if the extension is ".csv" (case-insensitive)
  return extension.downcase == ".csv"
end


def file 
if params[:myFile].present?
  $file = params[:myFile]
  if is_csv_file?( $file )
  redirect_to controller: :pdf, action: :uploadFile
else
  flash[:message] = 'Invalid File'
  render 'new'
end
else
  flash[:message] = 'Invalid File'
  render 'new'
end
end



  def multi_line

    @input = params[:multi_url]
    $after = @input.split(",")
    $size= $after.size 
    redirect_to :action => 'next'
  end 


def next
$size = $size - 1;
$original_url = $after[$size]
  if $size!= -1 
      if $original_url.present?
         if $original_url =~ /\A#{URI::regexp([ 'http', 'https'])}\z/
           @reply = 'valid url'
           @array = $original_url
           redirect_to :action => 'lookup_code'
    
           else
            flash[:message] = 'Invalid url'
           render 'new'
          end
          @reply = 'Invalid url' 
     
      end
      else
      flash[:message] = 'No More url'
       render 'new'
   
  end
end



 
    def check_url
      require 'uri'
      $original_url = params[:url]

    if $original_url.present?
      if $original_url =~ /\A#{URI::regexp([ 'http', 'https'])}\z/
        redirect_to :action => 'lookup_code'
      
    else
      @reply = 'Invalid url' 
      render 'new'
    end
  end
    end

    
    def lookup_code
      @display = "https://test.tin.ee/"
      $string = SecureRandom.uuid[0..6]
      $original_url = $original_url
      $shortened_url = @display+$string 
      @reply = 'Valid url'
      redirect_to :action => 'create'
   
    end

    def create

      @Short_url = ShortUrl.new(original_url: $original_url, shortened_url: $shortened_url)
  
      if @Short_url.save
        @original_url = $original_url
        @shortened_url = $shortened_url
        flash[:message] = "created succesfully."
        render 'show'
      else
        redirect_to root_path, notice: "!!!!ERROR!!!!"

      end
      
    
    end
    
    
    def ogurl

      # @original_url = $original_url.to_json
      render json: $original_url.to_json
        
    end

    def srtUrl
    
      # @shortened_url = $shortened_url.to_json
      render json: $shortened_url.to_json

    end

  
end