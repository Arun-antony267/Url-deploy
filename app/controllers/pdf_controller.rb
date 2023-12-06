class PdfController < ApplicationController
  require 'csv'
  
  def new
    redirect_to controller: :home, action: :new
  end

     def uploadFile
        @post = UrlFile.new(name: $file_name, attachment: $file )
        if @post.save   
          $file_strip = $file_content.split
          $line_count =  $file_strip.count 
           puts ($line_count)
          $file_s = $file_strip .each do |row|

            if $line_count.present?
                if  $element.present?
                     $size_pdf = $line_count
                     puts ("value present")
                     puts ($element)
                   else
                     puts ("value not present")
                 end
           
            else
              puts("Line count not present")
            end
        end
        # redirect_to controller: :home, action: :new
        redirect_to :action => 'new_line'
        else 
          puts ("File not saved")
          redirect_to controller: :home, action: :new
        # redirect_to :action => 'next_line'
        end
     end
     

    #  def next_line
    #   $size_pdf = $line_count 
    #   $size_pdf = $size_pdf -1
    #   $element = $csv_data [$size_pdf]
    #   @val1 = $element 
    #   if @val1 .present?
    #     if @val1 =~ /\A#{URI::regexp([ 'http', 'https'])}\z/
    #      $file_url = @val1
    #       redirect_to :action => 'shorten'
    #     else
    #       puts ( $file_url )
    #       flash[:message] = 'Invalid url'
    #       # redirect_to controller: :home, action: :new
    #   end
    #   else
    #     flash[:message] =  "End of file"
    #     redirect_to controller: :home, action: :new
    # end
    # end

    def new_line
      if $size_pdf.present?
      $size_pdf = $size_pdf - 1
      if $size_pdf != -1
        $element = $file_s [$size_pdf]
        if $element =~ /\A#{URI::regexp([ 'http', 'https'])}\z/

        redirect_to :action => 'shorten'
        else
          flash[:message] = "Invalid url"
        # redirect_to controller: :home, action: :new
           render "upload"
        end 
      else 
        flash[:message] = "End of file"
        redirect_to controller: :home, action: :new

      end     
    else
      flash[:message] = "End of file"
        redirect_to controller: :home, action: :new
    end
    end

      
   
      def shorten
         @display = "https://url-shortner-e2w9.onrender.com/i?q="
         @string = SecureRandom.uuid[0..6]
         $file_og_url = $element 
         $file_srt_url = @display+@string 
         flash[:message] = 'Valid url'
         redirect_to :action => 'display'
        # redirect_to controller: :home, action: :new
      
       end


       def display

         @Short_url = ShortUrl.new(user_id: $id, original_url: $file_og_url, shortened_url: $file_srt_url)
     
         if @Short_url.save
           @original_url = $file_og_url
           @shortened_url = $file_srt_url
           flash[:message] ="created succesfully."
          #  puts (@original_url)
          #   puts(@shortened_url )
          #  redirect_to controller: :home, action: :new

           render 'upload'

             
         else
           redirect_to root_path, notice: "!!!!ERROR!!!!"
   
         end
         
       
       end
     
      def fileOgUrl

        @file_original_url = $file_og_url.to_json
        render json: @file_original_url
          
      end
  
      def fileSrtUrl
      
        @file_shortened_url = $file_srt_url.to_json
        render json: @file_shortened_url
  
      end

      private
      
      def file_params
        params.permit(:file)
      end

end
    