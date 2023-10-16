require 'pdf/reader'
 require 'open-uri'

class PdfController < ApplicationController

    def read_pdf

    @pdf_file = $file

    # pdf_reader = PDF::Reader.new(@pdf_file)


    if @pdf_file .present?

       
        $pdfstatus = "Pdf uploaded"

        redirect_to :action => 'print_pdf'
        # redirect_to controller: "home", action: "new"
    else
        $pdfstatus ="Pdf not uploaded"

        redirect_to controller: "home", action: "new"
    end
   

    # pdf_reader.pages.each do |page|
    
    
end


      def print_pdf
        
        io =open($file)
        reader = PDF::Reader.new(io)

        puts reader.pdf_version
        puts reader.info
        puts reader.metadata
        puts reader.page_count

        redirect_to controller: "home", action: "new"
      end
      
end