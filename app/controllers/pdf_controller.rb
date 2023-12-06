class PdfController < ApplicationController
  require 'csv'
  
  def new
    redirect_to controller: :home, action: :new
  end

     def uploadFile
        @post = UrlFile.new(name: $file_name, attachment: $file )
        if @post.save   
          $file_urls = $file_content
          # $urls_chomp = $file_urls.chomp
          $csv_data = CSV.parse($file_urls)
          $line_count =  $csv_data.length
          $element = $csv_data[2]
          $csv_data.each do |row|
            # puts row
            if row.present?
            $file_s = row.to_s
              puts ("value present")
              puts (row)
            else
            puts ("value not present")
            end
          # end
            # You can access specific columns like this:
            # column_value = row['column_name']
          end
          # puts($csv_data )
          # puts ($line_count)
          # puts( $element  )
          # puts (line)
        redirect_to controller: :home, action: :new
        # redirect_to :action => 'next_line'
        else 
          puts ("File not saved")
          redirect_to controller: :home, action: :new
        # redirect_to :action => 'next_line'
        end
     end
     

      def readInputFile
          
            puts ("Reached Next function")

        redirect_to controller: :home, action: :new
      end


     def next_line
      $size_pdf = $line_count 
      $size_pdf = $size_pdf -1
      $element = $csv_data [$size_pdf]
      @val1 = $element 
      if @val1 .present?
        if @val1 =~ /\A#{URI::regexp([ 'http', 'https'])}\z/
         $file_url = @val1
          redirect_to :action => 'shorten'
        else
          puts ( $file_url )
          flash[:message] = 'Invalid url'
          redirect_to controller: :home, action: :new
      end
      else
        flash[:message] =  "End of file"
        redirect_to controller: :home, action: :new
    end
    end

    def new_line
      if $size_pdf.present?
      $size_pdf = $size_pdf - 1

      if $size_pdf != -1
        $element = $csv_data[$size_pdf]
        redirect_to :action => 'shorten'

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
         @display = "https://test.tin.ee/"
         @string = SecureRandom.uuid[0..6]
         $file_og_url = $element 
         $file_srt_url = @display+@string 
         flash[:message] = 'Valid url'
         redirect_to :action => 'display'
        # redirect_to controller: :home, action: :new
      
       end


       def display

         @Short_url = ShortUrl.new(original_url: $file_og_url, shortened_url: $file_srt_url)
     
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
    