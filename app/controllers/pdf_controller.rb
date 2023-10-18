class PdfController < ApplicationController

    def read_pdf
        redirect_to controller: "home", action: "new"
     end

     def uploadFile
        post = DataFile.save(  $file)
        redirect_to controller: "home", action: "new"
     end
  end

#     def read_pdf

#     @pdf = $file
#     name = upload[@pdf]
#     directory = "/home/arun"
#     # create the file path
#     path = File.join(directory, name)
#     aFile = File.open(path, "r")
#    if aFile
#     $value  = aFile.sysread(300)
#    puts $value 
#    redirect_to controller: "home", action: "new"
#   else 
#    puts "Unable to open file!"
#    redirect_to controller: "home", action: "new"
#    end
    