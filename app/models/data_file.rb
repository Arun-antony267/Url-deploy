class DataFile < ActiveRecord::Base

    def self.save(upload)

        @pdf = $file
       name = upload[@pdf]
       directory = "/home/arun/Downloads"
       # create the file path
       path = File.join(directory, name)
       # write the file
       aFile = File.open(path, "r")
      
       if aFile
        $value  = IO.readlines(aFile)
        $size=  $value.size 
        $element = $value [2]
        if $element.present?
            $dis=$element 
            $num = $size
        else
            $dis ='no elements left'
    #  $value  = aFile.sysread(3000)
        end
  else 
   puts $value ="Unable to open file!"
   
  end 
 end

 def next
 
 end
end