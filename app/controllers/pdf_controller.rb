class PdfController < ApplicationController
  
  def new
    redirect_to controller: :home, action: :new
  end

     def uploadFile
        post = DataFile.save($file)
        redirect_to :action => 'next_line'
     end
     
     def next_line
      $size_pdf =  $value.size 
      $size_pdf =$size_pdf -1
      $element = $value [$size_pdf]
      @val1 = $element 
      if @val1.present?
         @@file_url =@val1
          redirect_to :action => 'shorten'
      else

         @a ='no elements left'
         render 'upload'
      end
    end

    def new_line
      $size_pdf = $size_pdf - 1

      if $size_pdf != -1
        @@file_url = $value [$size_pdf]
        redirect_to :action => 'shorten'

      else 
        flash[:message] = "End of file"
        redirect_to controller: :home, action: :new

      end     
    end

      
   
      def shorten
         @display = "https://test.tin.ee/"
         @string = SecureRandom.uuid[0..6]
         @file_url = @@file_url
         @@file_srt_url = @display+@string 
         @reply = 'Valid url'
    
         redirect_to :action => 'display'
      
       end


       def display

         @Short_url = ShortUrl.new(original_url: @@file_url, shortened_url: @@file_srt_url)
     
         if @Short_url.save
           @original_url = @@file_url
           @shortened_url = @@file_srt_url
           @reply = "created succesfully."
           render 'upload'
             
         else
           redirect_to root_path, notice: "!!!!ERROR!!!!"
   
         end
         
       
       end
     
      def fileOgUrl

        @original_url = @@file_url.to_json
        render json: @original_url
          
      end
  
      def fileSrtUrl
      
        @shortened_url = @@file_srt_url.to_json
        render json: @shortened_url
  
      end
  

end
    