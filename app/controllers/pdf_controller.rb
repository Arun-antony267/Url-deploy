class PdfController < ApplicationController
  

     def uploadFile
        post = DataFile.save($file)
        redirect_to :action => 'next_line'
     end
     
     def next_line
      $size_pdf =  $value.size 
      $limit = 1;
      $element = $value [$limit]
      @val1 = $element 
      if @val1.present?
         @@file_url =@val1
        #  render 'upload'
          redirect_to :action => 'shorten'

      else

         @a ='no elements left'
         render 'upload'
         #  $value  = aFile.sysread(3000)
      end
    end

    def new_line
     @z= 'this is from pdf/new '
      render 'upload'
    end

      
   
      def shorten
         @display = "https://test.tin.ee/"
         @string = SecureRandom.uuid[0..6]
         @file_url = @@file_url
         @@file_srt_url = @display+@string 
         @reply = 'Valid url'
         render 'upload'
         # redirect_to :action => 'display'
      
       end


      #  def display

      #    @Short_url = ShortUrl.new(original_url: $original_url, shortened_url: $shortened_url)
     
      #    if @Short_url.save
      #      @original_url = $original_url
      #      @shortened_url = $shortened_url
      #      @reply = "created succesfully."
      #      render 'upload'
             
      #    else
      #      redirect_to root_path, notice: "!!!!ERROR!!!!"
   
      #    end
         
       
      #  end
     
      def fileOgUrl

        @original_url = @@file_url.to_json
        render json: @original_url
          
      end
  
      def fileSrtUrl
      
        @shortened_url = @@file_srt_url.to_json
        render json: @shortened_url
  
      end
  

end
    